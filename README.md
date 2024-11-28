# Getting and Cleaning Data Course Project

## Purpose of the Project
The goal of this project is to demonstrate the ability to collect, clean, and prepare data for analysis. Specifically, this project processes data collected from the accelerometers of Samsung Galaxy smartphones and creates a tidy dataset suitable for analysis. The raw dataset contains information about human activities and measurements, and the tidy dataset summarizes this data by activity and subject.

## How the Script Works
The analysis is performed using an R script named `run_analysis.R`. The script executes the following steps:
1. **Load the required data**: Reads data from the training and test sets along with their corresponding activity labels and subject IDs.
2. **Merge datasets**: Combines training and test datasets into one dataset.
3. **Extract relevant measurements**: Selects only the measurements on the mean and standard deviation for each measurement.
4. **Add descriptive activity names**: Replaces activity IDs with their corresponding descriptive names.
5. **Label the data**: Renames the columns with more descriptive variable names for clarity.
6. **Create a tidy dataset**: Groups the data by activity and subject, calculates the average of each variable, and creates a tidy dataset.

## Outputs
- The final tidy dataset is saved as a file named `tidy_dataset.txt`.
- This dataset contains the average of each measurement variable for each activity and subject.

## Requirements
- The script requires the `dplyr` library for data manipulation.
- Ensure the `UCI HAR Dataset` folder is in the working directory before running the script.

## Running the Script
1. Download and unzip the dataset from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Place the dataset in your working directory.
3. Run the `run_analysis.R` script using R or RStudio:
   ```R
   source("run_analysis.R")
