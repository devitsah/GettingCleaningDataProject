---

### **`CodeBook.md`**

This file provides a detailed description of the variables in the dataset and the transformations performed.

#### **Example Content for `CodeBook.md`**
```markdown
# CodeBook

## Description
This codebook describes the variables in the tidy dataset `tidy_dataset.txt` and the transformations applied during the data cleaning process.

## Variables in the Tidy Dataset
- **subject**: An integer identifying the subject who performed the activity (ranges from 1 to 30).
- **activity**: A factor variable with the following activity labels:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
- **Other variables**: Each remaining variable corresponds to the mean of a measurement taken from the accelerometer or gyroscope signals for the specific activity and subject. Examples include:
  - `timeBodyAccelerometerMeanX`: Mean value of time-domain body acceleration along the X axis.
  - `timeBodyAccelerometerMeanY`: Mean value of time-domain body acceleration along the Y axis.
  - `frequencyBodyGyroscopeMeanZ`: Mean value of frequency-domain body gyroscope signal along the Z axis.
  - `timeBodyAccelerometerStandardDeviationX`: Standard deviation of time-domain body acceleration along the X axis.
  - (More variables are included in the dataset and follow this naming convention.)

## Transformations Performed
1. **Merging Data**: Combined the training and test datasets into a single dataset.
2. **Extracting Measurements**: Selected only measurements related to the mean and standard deviation for each measurement.
3. **Descriptive Activity Names**: Replaced numeric activity codes with descriptive names (e.g., "1" became "WALKING").
4. **Labeling Variables**: Renamed variables with descriptive names:
   - Replaced prefixes like `t` with `time` and `f` with `frequency`.
   - Expanded abbreviations (e.g., `Acc` to `Accelerometer`, `Gyro` to `Gyroscope`).
   - Removed special characters and made names human-readable.
5. **Creating the Tidy Dataset**: Calculated the average of each variable for each combination of subject and activity.

## Notes on the Data
- The dataset conforms to the principles of tidy data: each variable is a column, each observation is a row, and each observational unit is a table.
- The dataset contains 180 rows (30 subjects × 6 activities) and 68 columns.

## References
- Dataset source: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
- Additional information: [README.md from the original dataset](UCI HAR Dataset/README.txt)
