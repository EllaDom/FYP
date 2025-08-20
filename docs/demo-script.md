# Demo Script (Abnormal Event Detection & CAPEC Mapping)

This document explains how to run the modules of our project.  
The steps include cleaning raw datasets, detecting abnormal events, applying dynamic thresholds, and generating graphs.

---

## Requirements
Before running, make sure the following libraries are installed:

```bash
pip install pandas
pip install openpyxl
pip install pyyaml
pip install networkx
pip install matplotlib
```
## Clean Raw Datasets
Run the cleaning scripts to preprocess logon.csv and file.csv:

```bash
python cleaning_logon.py
python cleaning_file.py
```

## Detect Abnormal Events
Apply initial rule-based detection:

```bash
python events/detect_events.py
```

## Generate Suspicious Events with Dynamic Thresholding
Run thresholding logic configured in config.yaml:

```bash
python dynamic\ thresholding/generate_suspicious_events.py
```

## Graph Construction & Visualization
Run graph scripts one by one:

```bash
python graph_overview.py
python user_activity_capec.py
python peruser_subgraph_gen.py
python hardcoded-dicomCVE.py
```

## Demo Presentation Flow

1. Show the raw → cleaned dataset transition.

2. Show abnormal events identified (events.csv).

3. Show mapping of suspicious behaviors to CAPEC patterns.

4. Present graph visualizations:

  ->System-level overview

  ->User activity CAPEC mapping

  ->Per-user subgraph

  ->DICOM CVE healthcare slice
