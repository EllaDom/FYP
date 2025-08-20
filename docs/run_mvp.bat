@echo off
REM =======================================================
REM Phase 1 MVP Run Script (Windows)
REM Abnormal Event Detection & CAPEC Mapping
REM =======================================================

echo === Installing Required Python Packages ===
pip install pandas
pip install openpyxl
pip install pyyaml
pip install networkx
pip install matplotlib

echo === Step 1: Cleaning Datasets ===
python cleaning_logon.py
python cleaning_file.py

echo === Step 2: Detecting Abnormal Events ===
python events\detect_events.py

echo === Step 3: Applying Dynamic Thresholding ===
python "dynamic thresholding\generate_suspicious_events.py"

echo === Step 4: Generating Graphs ===
python graph_overview.py
python user_activity_capec.py
python peruser_subgraph_gen.py
python hardcoded-dicomCVE.py

echo === Phase 1 Execution Complete ===
echo Outputs generated:
echo  - Cleaned datasets: dataset\logon_cleaned.csv, dataset\file_cleaned.csv
echo  - Suspicious events: events\events.csv
echo  - Graphs: overall_graph_overview.png, user_activity_capec_graph.png, subgraph_capec.png, dicomcve-subgraph.png

pause
