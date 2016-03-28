## Getting and Cleaning Data Course Project
# Getting Data from the Web
if(!file.exists("./project")){dir.create("./project")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./project/har_data.zip", method = "auto")
unzip("./project/har_data.zip", exdir = "./project/har_data")

# Set working directory
setwd("D:/MOOC/Coursera_Data Science Specialization/3.1 Gettng and Cleaning Data/GetCleanData/project/har_data")

## Read into R the dataset information
signalfeatures <- read.table("UCI HAR Dataset/features.txt", na.strings=c("", "NA"), col.names = c("signalfeatureid", "signalfeature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", na.strings=c("", "NA"), col.names=c("activityid", "activity"))
activities$activity <- gsub("_", "", as.character(activities$activity))
activities$activity <- tolower(as.character(activities$activity))
featureswewant <- grep("-mean\\(\\)|-std\\(\\)", signalfeatures$signalfeature)

# Read into R training data
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt", na.strings=c("", "NA"), col.names = "subjectid")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", na.strings=c("", "NA"))
ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt", na.strings=c("", "NA"))

# Read into R test data 
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt", na.strings=c("", "NA"), col.names = "subjectid")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt",  na.strings=c("", "NA"))
ytest <- read.table("UCI HAR Dataset/test/Y_test.txt",  na.strings=c("", "NA"))

# Merge trainning aned test data into a sigle table
library(dplyr)
subject <- bind_rows(subjecttrain, subjecttest)
x <- bind_rows(xtrain, xtest)
x <- x[, featureswewant]
names(x) <- gsub("\\(|\\)", "", signalfeatures$signalfeature[featureswewant])
y <- bind_rows(ytrain, ytest)
names(y) <- "activityid"
activity <- full_join(y, activities, by = "activityid")
har <- bind_cols(subject, x, activity)
write.table(har, "mergedtidydata.txt")

# 2nd tigy table
library(data.table)
hartable <- data.table(har)
averagehar<- hartable[, lapply(.SD, mean), by=c("subjectid", "activity")]
write.table(averagehar, "tidymeanhar.txt")
