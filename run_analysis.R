# Load necessary libraries
install.packages("dplyr")
library(dplyr)
# Read activity labels and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))

# Read training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_id")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# Read test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_id")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

# Merge training and test datasets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Combine all data into one dataset
merged_data <- cbind(subject_data, y_data, x_data)
# Select columns with mean or std in their names
selected_features <- grepl("mean|std", features$feature, ignore.case = TRUE)
selected_data <- merged_data[, c(TRUE, TRUE, selected_features)]
# Merge with activity labels to replace activity IDs with names
selected_data <- merge(selected_data, activity_labels, by.x = "activity_id", by.y = "id")
# Clean up variable names
names(selected_data) <- gsub("^t", "Time", names(selected_data))
names(selected_data) <- gsub("^f", "Frequency", names(selected_data))
names(selected_data) <- gsub("Acc", "Accelerometer", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyroscope", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitude", names(selected_data))
names(selected_data) <- gsub("\\.\\.\\.", ".", names(selected_data))
# Create tidy dataset with the average of each variable for each activity and subject
tidy_data <- selected_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean, .names = "mean_{.col}"))
  # Write the tidy data to a text file
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)