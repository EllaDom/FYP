import pandas as pd
import yaml

# ---------- Load config ----------
with open("config.yml") as f:
    cfg = yaml.safe_load(f)

# ---------- Load cleaned datasets ----------
logon = pd.read_csv("logon_cleaned.csv")
file = pd.read_csv("file_cleaned.csv")

logon['date'] = pd.to_datetime(logon['date'])
file['date'] = pd.to_datetime(file['date'])

events = []

# ---------- RULE 1: Odd-hour logins ----------
start_hour = cfg['odd_hour_login']['start_hour']
end_hour = cfg['odd_hour_login']['end_hour']
score_odd = cfg['odd_hour_login']['score']

for _, row in logon.iterrows():
    hour = row['date'].hour
    abnormal_flag = 1 if hour < start_hour or hour > end_hour else 0
    events.append([row['date'], row['user'], row['pc'], "logon", abnormal_flag, score_odd if abnormal_flag else 0])

# ---------- RULE 2: Multiple logins in short time ----------
count_threshold = cfg['multiple_logins']['count_threshold']
time_window = cfg['multiple_logins']['time_window_minutes']
score_multi = cfg['multiple_logins']['score']

logon_sorted = logon.sort_values(by=['user', 'date'])
for user, grp in logon_sorted.groupby('user'):
    grp = grp.sort_values('date')
    for i in range(len(grp) - count_threshold + 1):
        if (grp.iloc[i + count_threshold - 1]['date'] - grp.iloc[i]['date']).total_seconds() <= time_window * 60:
            events.append([grp.iloc[i]['date'], user, grp.iloc[i]['pc'], "multiple_logins", 1, score_multi])

# ---------- RULE 3: USB file write ----------
usb_field = cfg['usb_file_write']['detection_field']
score_usb = cfg['usb_file_write']['score']

for _, row in file.iterrows():
    abnormal_flag = 1 if row.get(usb_field, False) else 0
    events.append([row['date'], row['user'], row['pc'], "file_write", abnormal_flag, score_usb if abnormal_flag else 0])

# ---------- RULE 4: Mass file access ----------
file_count_threshold = cfg['mass_file_access']['file_count_threshold']
time_window_hours = cfg['mass_file_access']['time_window_hours']
score_mass = cfg['mass_file_access']['score']

file_sorted = file.sort_values(by=['user', 'date'])
for user, grp in file_sorted.groupby('user'):
    grp = grp.sort_values('date')
    for i in range(len(grp)):
        start = grp.iloc[i]['date']
        window = grp[(grp['date'] >= start) & (grp['date'] <= start + pd.Timedelta(hours=time_window_hours))]
        if len(window) > file_count_threshold:
            events.append([start, user, grp.iloc[i]['pc'], "mass_file_access", 1, score_mass])

# ---------- Save results ----------
events_df = pd.DataFrame(events, columns=["date", "user", "pc", "activity", "abnormal_flag", "score"])
events_df.to_csv("suspicious_events.csv", index=False)

print("Saved: suspicious_events.csv")
