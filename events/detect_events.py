import pandas as pd
logon = pd.read_csv("logon_cleaned.csv")
file = pd.read_csv("file_cleaned.csv")

logon['date'] = pd.to_datetime(logon['date'])
file['date'] = pd.to_datetime(file['date'])

events = []

# ---------- RULE 1: Odd-hour logins ----------
for _, row in logon.iterrows():
    abnormal_flag, score = 0, 0
    hour = row['date'].hour
    if hour < 8 or hour > 20:  # outside 08:00–20:00
        abnormal_flag, score = 1, 0.7
    events.append([row['date'], row['user'], row['pc'], "logon", abnormal_flag, score])

# ---------- RULE 2: Multiple logins in short time ----------
logon_sorted = logon.sort_values(by=['user', 'date'])
for user, grp in logon_sorted.groupby('user'):
    grp = grp.sort_values('date')
    for i in range(len(grp) - 3):
        if (grp.iloc[i+3]['date'] - grp.iloc[i]['date']).total_seconds() <= 600:  # 10 mins
            events.append([grp.iloc[i]['date'], user, grp.iloc[i]['pc'], "multiple_logins", 1, 0.8])

# ---------- RULE 3: USB file write ----------
for _, row in file.iterrows():
    abnormal_flag, score = 0, 0
    if row.get("to_removable_media", False) == True:
        abnormal_flag, score = 1, 0.9
    events.append([row['date'], row['user'], row['pc'], "file_write", abnormal_flag, score])

# ---------- RULE 4: Mass file access ----------
file_sorted = file.sort_values(by=['user', 'date'])
for user, grp in file_sorted.groupby('user'):
    grp = grp.sort_values('date')
    for i in range(len(grp)):
        start = grp.iloc[i]['date']
        window = grp[(grp['date'] >= start) & (grp['date'] <= start + pd.Timedelta(hours=1))]
        if len(window) > 20:
            events.append([start, user, grp.iloc[i]['pc'], "mass_file_access", 1, 1.0])

# ---------- Save results ----------
events_df = pd.DataFrame(events, columns=["date", "user", "pc", "activity", "abnormal_flag", "score"])
events_df.to_csv("events.csv", index=False)

print("Saved: events.csv")
