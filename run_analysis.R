## Getting and Cleaning Data Course Project

## https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project

## 1 Merges the training and the test sets to create one data set.
## 2 Extracts only the measurements on the mean and standard deviation for each
##   measurement.
## 3 Uses descriptive activity names to name the activities in the data set
## 4 Appropriately labels the data set with descriptive variable names.
## 5 From the data set in step 4, creates a second, independent tidy data set
##   with the average of each variable for each activity and each subject.

## Load Data
## Name: Human Activity Recognition Using Smartphones Data Set
## Description: https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

library(tidyverse)

setwd("./")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- "data/har.zip"
data <- "data/UCI HAR Dataset"

# Create data directory
if(!file.exists("data")) {
  dir.create("data")
}

# Retrieve data file
if(!file.exists(data)) {
  download.file(fileUrl, destfile = file, method = "curl")
  unzip(file, exdir = "data")
  file.remove(file)

  dateDownloaded <- date()
  dateDownloaded
}

# 1. Merge test and train datasets
test <- file.path(data, "test")
train <- file.path(data, "train")

subjectTest <- read_table(file.path(test, "subject_test.txt"), col_names = FALSE)
subjectTrain <- read_table(file.path(train, "subject_train.txt"), col_names = FALSE)
subject <- bind_rows(subjectTest, subjectTrain) %>%
  setNames("subject")

XTest <- read_table(file.path(test, "X_test.txt"), col_names = FALSE)
XTrain <- read_table(file.path(train, "X_train.txt"), col_names = FALSE)
x <- bind_rows(XTest, XTrain)

yTest <- read_table(file.path(test, "y_test.txt"), col_names = FALSE)
yTrain <- read_table(file.path(train, "y_train.txt"), col_names = FALSE)
activity <- bind_rows(yTest, yTrain) %>%
  setNames("activity")

# 2. Extract mean and standard deviation for each measurement AND
# 4. Use descriptive variable names
features <- read_delim(file.path(data, "features.txt"),
                       delim = " ",
                       col_names = FALSE)

xMeanStd <- x %>%
  setNames(make.names(features$X2, unique = TRUE)) %>%
  setNames(gsub("\\.{2,}", "\\.", names(.))) %>%
  select(matches("mean\\.|std\\.")) %>%
  setNames(gsub("mean", "Mean", names(.))) %>%
  setNames(gsub("std", "Std", names(.))) %>%
  setNames(gsub("\\.", "", names(.))) %>%
  setNames(gsub("^t", "time", names(.))) %>%
  setNames(gsub("^f", "frequency", names(.)))

# 3. Use descriptive activity labels
activityLabels <- read_delim(file.path(data, "activity_labels.txt"),
                             delim = " ",
                             col_names = FALSE)

activity <- activity %>%
  mutate(activity = factor(activity, labels = activityLabels$X2)) %>%
  select(activity)

# Merge data sets
all <- bind_cols(subject, activity, xMeanStd)

# 5. Create and Write secondary tidy data set
tidy <- all %>%
  group_by(activity, subject) %>%
  summarize_all(funs(mean))

# Write tidy data set to delimited file
if(!file.exists("output")) {
  dir.create("output")
}
write.table(tidy, file.path("output", "activity_subject_mean.txt"), row.names = FALSE)
