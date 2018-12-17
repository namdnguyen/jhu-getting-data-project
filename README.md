# Getting and Cleaning Data Course Project

This repository contains files for the John Hopkins "Getting and Cleaning Data" Coursera course project.

- `CodeBook.MD`: code book with details on the data
- `run_analysis.R`: the analysis R script
- `output/activity_subject_mean.txt`: generated tidy dataset produced by `run_analysis.R`

## Data
The data used in this project is from the [Human Activity Recognition Using Smartphones Data Set](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The data contain experimental measurements for 30 subjects performing six activities while wearing a smart phone that has an accelerometer and gyroscope.


## Code Book
The code book contains information on the variables used in the project, additional details on the data sets, and a description of the data transformation and aggregations.


## How the `run_analysis.R` Script Works
The `run_analysis.R` script contains the R code that is used to download the data sets. The script then merges, cleans, transforms, and summarizes the data sets.

The script also generates a secondary, independent data set that contains the averages for each of the variables by activity for each subject. The generated data set is saved to the `output` directory and stored in the same space-delimited txt file as the original data sets.

The steps of the analysis script are listed below:

1. Download data sets
2. Merge testing and training data sets
3. Extract the measurements of the mean and standard deviation for each measurement
4. Clean variable names and make them more descriptive
5. Convert activity values to factors with descriptive names
6. Merge all columns into a single data frame
7. Calculate the mean of each measurement, grouped by activity and subject
8. Save calculated data set to `output`
