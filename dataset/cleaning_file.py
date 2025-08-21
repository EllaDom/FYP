import pandas as pd

# Load the CSV file
df = pd.read_csv("file.csv")

# Step 1: Fix date format
df['date'] = pd.to_datetime(df['date'], errors='coerce')

# Step 2: Remove invalid rows
df = df.dropna(subset=['id', 'date', 'user', 'pc', 'filename', 'activity'])
df = df.drop_duplicates()

# Step 3: Normalize text columns
df['user'] = df['user'].str.lower()
df['pc'] = df['pc'].str.upper()
df['filename'] = df['filename'].str.strip().str.lower()
df['activity'] = df['activity'].str.capitalize()

# Optional: Convert boolean-like columns
df['to_removable_media'] = df['to_removable_media'].astype(int)
df['from_removable_media'] = df['from_removable_media'].astype(int)

# Step 4: Reduce size (~1L entries)
df_sample = df.sample(n=100000, random_state=42)   # random sampling

# Step 5: Save cleaned file
df_sample.to_csv("../backend/file_cleaned.csv", index=False)
