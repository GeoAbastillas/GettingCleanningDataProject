---
title: "code book"
author: "GNA"
date: "March 28, 2016"
output: html_document
---

# Code Book

## Getting and Cleaning Data Process Flow

The source data comes from UCI Machine Learning Repository; the dataset can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

1. Downloaded the data set and unzip in a local directory
2. Load into R the training and test data set including variable names and activity labels.
3. Combine training and test data frames using bind_rows(dplyr package)
4. Select measurements with the mean and standard deviation variables.
5. Combine the activity label variable to the data frame.
6. Combine the data frame into a single table contaning the subjects, measurements and the respective activity.
7. Write the combined dataset as a text file.
8. Create a table using the data.table package and group by subject and activity with calculations of the average measurements for each activity and subject.
Write a second text file of the table in item 8.

# Variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.:


    *subjectId: 1 to 30 each representing a participant in the study
    *activity: the activity that the subject was doing at the time of the measurement
    *tBodyAcc-mean-X
    *tBodyAcc-mean-Y
    *tBodyAcc-mean-Z
    *tBodyAcc-std-X
    *tBodyAcc-std-Y
    *tBodyAcc-std-Z
    *tGravityAcc-mean-X
    *tGravityAcc-mean-Y
    *tGravityAcc-mean-Z
    *tGravityAcc-std-X
    *tGravityAcc-std-Y
    *tGravityAcc-std-Z
    *tBodyAccJerk-mean-X
    *tBodyAccJerk-mean-Y
    *tBodyAccJerk-mean-Z
    *tBodyAccJerk-std-X
    *tBodyAccJerk-std-Y
    *tBodyAccJerk-std-Z
    *tBodyGyro-mean-X
    *tBodyGyro-mean-Y
    *tBodyGyro-mean-Z
    *tBodyGyro-std-X
    *tBodyGyro-std-Y
    *tBodyGyro-std-Z
    *tBodyGyroJerk-mean-X
    *tBodyGyroJerk-mean-Y
    *tBodyGyroJerk-mean-Z
    *tBodyGyroJerk-std-X
    *tBodyGyroJerk-std-Y
    *tBodyGyroJerk-std-Z
    *tBodyAccMag-mean
    *tBodyAccMag-std
    *tGravityAccMag-mean
    *tGravityAccMag-std
    *tBodyAccJerkMag-mean
    *tBodyAccJerkMag-std
    *tBodyGyroMag-mean
    *tBodyGyroMag-std
    *tBodyGyroJerkMag-mean
    *tBodyGyroJerkMag-std
    *fBodyAcc-mean-X
    *fBodyAcc-mean-Y
    *fBodyAcc-mean-Z
    *fBodyAcc-std-X
    *fBodyAcc-std-Y
    *fBodyAcc-std-Z
    *fBodyAccJerk-mean-X
    *fBodyAccJerk-mean-Y
    *fBodyAccJerk-mean-Z
    *fBodyAccJerk-std-X
    *fBodyAccJerk-std-Y
    *fBodyAccJerk-std-Z
    *fBodyGyro-mean-X
    *fBodyGyro-mean-Y
    *fBodyGyro-mean-Z
    *fBodyGyro-std-X
    *fBodyGyro-std-Y
    *fBodyGyro-std-Z
    *fBodyAccMag-mean
    *fBodyAccMag-std
    *fBodyBodyAccJerkMag-mean
    *fBodyBodyAccJerkMag-std
    *fBodyBodyGyroMag-mean
    *fBodyBodyGyroMag-std
    *fBodyBodyGyroJerkMag-mean
    *fBodyBodyGyroJerkMag-std*
