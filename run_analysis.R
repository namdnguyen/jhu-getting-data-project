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
