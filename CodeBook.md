# Getting and Cleaning Data Course Project Code Book

## Data Source
The data used in this project is from the [Human Activity Recognition Using Smartphones Data Set](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The data contain experimental measurements for 30 subjects performing six activities while wearing a smart phone that has an accelerometer and gyroscope.

The README file included with the data set contains additional information on the data.

The data is divided into a test set and a training set. The data used for this project include the following files. Note: for simplicity, the list below does not distinguish between test and training sets, but the files do.

- `subject`: subject ID for each observation
- `X`: 561-vector of measurement data
- `y`: activity ID for each observation
- `features`: feature labels for 561 measurement features
- `activity_labels`: labels for activity IDs

## Variables
**Name: subject** \
Type: integer\
Range: 1-30\
Description: Unique ID for each of the subjects who took part in the experiment.\

**Name: activity**\
Type: character\
Levels:

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

Description: The activity performed by a subject.

**Name: Device Measurement Variables**\
Type: numeric\
Range: -1 to 1\
Measurement Type: time or frequency\
Statistics Value: mean or standard deviation\
Description: Readings from the accelerometer and gyroscope of the smart phone used to measure subject activities. Each measurement includes the x, y, and z axis value.

Measurement Variables:

- BodyAcc
- GravityAcc
- BodyAccJerk
- BodyGyro
- BodyGyroJerk
- BodyAccMag
- GravityAccMag
- BodyAccJerkMag
- BodyGyroMag
- BodyGyroJerkMag
- BodyBodyAccJerkMag
- BodyBodyGyroMag
- BodyBodyGyroJerkMag
- angletBodyAcc
- angletBodyAccJerk
- angletBodyGyro
- angletBodyGyroJerk
- anglegravity

## Data Transformation and Feature Selection
The `activity_subject_mean.txt` data set is generated by merging and reshaping the UCI "Human Activity Recognition Using Smartphones Data Set", then summarizing the data set by taking the mean for each measurement, grouped by the activity type and subject ID.

The data transformation process is detailed below.

### 1. Merge Test and Training Data Sets
The testing and training data sets each included three files that were used for the project:

- A file that recorded the subject ID for each observation
- A file that recorded the activity ID,
- A file that included all activity measurements from the smart phone

The testing and training data sets were combined into one set of data sets.

### 2. Add Variable Names
The first two files were given variable names that described their data, `subject` and `activity`. For the measurement data set, the 561 variable names were taken from the `features.txt` file. The variable names were cleaned to removed symbols from the original file and ones altered during the file reading process.

Measure variable names now follow camel case. The `t` and `f` prefix were also expanded to include their more descriptive form of `time` and `frequency`.

### 3. Recode Activity Variable
The activity variable is code by an integer index, ranging from 1-6. The variable is recoded as factors to display the string value, instead of the integer. The levels and labels used from `activity_labels.txt` are listed below:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

### 4. Extract Mean and Standard Deviation Variables
The script next extracts only the mean and standard deviation variables, not including the mean frequency variables. This operation reduces the list of 561 measurement variables to 73 variables.

### 5. Summarize Means
The three data sets are merged into one data set, which is used to create a secondary, independenta data set. The generated data set follows tidy data principles by having each row be an observation and each column be a variable. Each measurement variable is summarized by taking its mean, grouped by the activity and subject ID.

This data set is saved in the `output` directory as a space-delimited txt file.
