## You should create one R script called run_analysis.R that does the following. 

## Merges the training and the test sets to create one data set.

## Extracts only the measurements on the mean and standard deviation for each measurement. 

## Uses descriptive activity names to name the activities in the data set

## Appropriately labels the data set with descriptive variable names. 

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# IMPORTNAT >> Load required packages
library(dplyr)
library(tidyverse)

# This code reads the relevant files into R
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "name"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("index", "activity"))
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$name)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$name)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")

# This code merges the training and test datasets
subject <- rbind(subject_train, subject_test)
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)

# This code extracts the mean and standard deviation measurements
mean_std_features <- features[grep("(mean|std)\\(\\)", features$name), ]
X <- X[, mean_std_features$index]

# This code assigns descriptive activity names to the activities dataset
y$activity <- activities$activity[y$activity]

# This code labels the dataset with descriptive variable names
names(X) <- gsub("std", "StdDev", names(X))
names(X) <- gsub("mean", "Mean", names(X))
names(X) <- gsub("^t", "Time", names(X))
names(X) <- gsub("^f", "Frequency", names(X))
names(X) <- gsub("Acc", "Acceleration", names(X))
names(X) <- gsub("Gyro", "Gyroscope", names(X))
names(X) <- gsub("Mag", "Magnitude", names(X))
names(X) <- gsub("BodyBody", "Body", names(X))
names(X) <- gsub("Jerk", "Jerk", names(X))
names(X) <- gsub("Gravity", "Gravity", names(X))
names(X) <- gsub("\\()", "", names(X))
names(X) <- gsub("-", "_", names(X))
names(X) <- gsub("([[:lower:]])([[:upper:]])", "\\1_\\2", names(X), perl = TRUE)
names(X) <- make.names(names(X), unique = TRUE)

# This code merges subject, activity, and features data
merged_data <- cbind(subject, y, X)

# This code creates a tidy dataset with the average of each variable for each activity and subject
tidy_data <- merged_data %>%
  group_by(subject, activity) %>%
  summarize(across(everything(), mean, .names = "mean_{.col}"))

# This code writes the tidy dataset to a text file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)