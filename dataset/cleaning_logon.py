import pandas as pd

# Load the Excel file
df = pd.read_excel("logon.xlsx")

# Step 1: Fix date format
df['date'] = pd.to_datetime(df['date'], errors='coerce')

# Step 2: Remove invalid rows
df = df.dropna(subset=['date', 'user', 'pc', 'activity'])
df = df.drop_duplicates()

# Step 3: Normalize
df['user'] = df['user'].str.lower()
df['pc'] = df['pc'].str.upper()
df['activity'] = df['activity'].str.capitalize()

# Step 4: Reduce size (~1L entries)
df_sample = df.sample(n=100000, random_state=42)   # random sampling

# Step 5: Save cleaned file
df_sample.to_excel("../backend/logon_cleaned.xlsx", index=False)
