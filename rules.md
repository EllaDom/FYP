# Rules for Abnormal Event Detection

This document explains the rules and logic applied to detect abnormal user behavior in our dataset.

## Dataset Sources
- **logon.csv** → user login and logout activities
- **file.csv** → file access activities (open, copy, write, removable media)

## Normal vs. Abnormal Behavior
Since the dataset is not labeled, we apply rule-based heuristics to mark suspicious activities.

### Rules Implemented
1. **Multiple Failed Logins**
   - Repeated login attempts within a short interval from the same user/PC.
   - Mapped to **CAPEC-112: Brute Force**.

2. **Off-Hour Logins**
   - User logins outside of standard working hours (e.g., 9 AM–6 PM).
   - Mapped to **CAPEC-560: Insider Attack**.

3. **Multi-PC Logins**
   - Same user logged in on multiple PCs in overlapping time windows.
   - Indicates account sharing or compromise.

4. **File Exfiltration**
   - File copied to removable media.
   - Mapped to **CAPEC-118: Data Leakage**.

5. **Abnormal File Activity Burst**
   - More than N file accesses within a short interval.
   - Mapped to **CAPEC-653: Rapid Access Pattern**.

6. **Removable Media Access**
   - File accessed directly from USB.
   - Mapped to **CAPEC-122: Unauthorized Device Access**.

### Dynamic Thresholding
- Thresholds (e.g., number of logins, number of files) are not fixed.
- Configured in `dynamic thresholding/config.yaml`.
- Example: 
  ```yaml
  max_failed_logins: 5
  max_file_access_burst: 20
