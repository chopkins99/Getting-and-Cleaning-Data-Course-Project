## Getting and Cleaning Data: Final Course Project
## Reviewed David Hood article posted in Coursera discussion forum
#  https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

library(data.table)
library(dplyr)

#### Download and Unzip File ####

# download zip file containing data (if it has not already been downloaded)
# Based off of Stack Overflow reponses to question on doing this
# https://stackoverflow.com/questions/45518229/using-download-file-to-download-a-zip-file-from-url-in-r

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

if (!file.exists(zipFile)) {
  download.file(fileUrl, zipFile, mode = "wb") # mode = "wb" needed for Windows
}

# unzip zip file containing data (if data directory does not already exist)
if (!file.exists("UCI HAR Dataset")) {
  unzip(zipFile)
}

#### Read Data Files into Data Tables ####

# read training data
trainingSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainingValues <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainingActivity <- read.table("./UCI HAR Dataset/train/y_train.txt")

# read test data
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testValues <- read.table("./UCI HAR Dataset/test/X_test.txt")
testActivity <- read.table("./UCI HAR Dataset/test/y_test.txt")

# read features (do not convert text labels to factors)
features <- read.table("./UCI HAR Dataset/features.txt", as.is = TRUE)

# read activity labels
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

#### Combine Data Tables to form One Data Table ####
trainingData <- cbind(trainingSubjects, trainingValues, trainingActivity)
testData <- cbind(testSubjects, testValues, testActivity)
humanActivitydb <- rbind(trainingData, testData)

#Remove individual training and test data tables from memory
rm(trainingSubjects, trainingValues, trainingActivity)
rm(testSubjects, testValues, testActivity)
rm(testData, trainingData)

#### Assign Column Names to Human Activity Data Table ####

colnames(humanActivitydb) <- c("subject", features[, 2], "activity")

#### Make table containing only the columns of interest ####
#### (mean and standard deviation) for each subject     ####
# Note: cannot use "select" because of multiple features with same name
#  the below "grepl" approach creates a logical vector of TRUE/FALSE for each
#  column which meets the criteria.  Can then 'keep' only the TRUE columns

keepColumns <- grepl("subject|mean|std|activity", colnames(humanActivitydb))
tidyActivitydb <- humanActivitydb[, keepColumns]

#### Clean up (tidy) the column names ####
columnNames <- colnames(tidyActivitydb)
columnNames <- gsub("\\(\\)-", "", columnNames)  # remove ()-
columnNames <- gsub("\\(\\)", "", columnNames)  # remove ()
columnNames <- gsub("stddev", "StandardDeviation", columnNames)  # expand stddev
columnNames <- gsub("std", "StandardDeviation", columnNames)  # expand std
columnNames <- gsub("^f", "FrequencyDomain", columnNames)  # expand f
columnNames <- gsub("^t", "TimeDomain", columnNames) # expand t
columnNames <- gsub("Acc", "Accelerometer", columnNames) # expand Acc
columnNames <- gsub("Gyro", "Gyroscope", columnNames) # expand Gyro
columnNames <- gsub("Mag", "Magnitude", columnNames) # expand Mag
columnNames <- gsub("Freq", "Frequency", columnNames) # expand Freq
columnNames <- gsub("BodyBody", "Body", columnNames) # fix BodyBody

# replace old column names with tidy column names
colnames(tidyActivitydb) <- columnNames

#### Replace activity codes with activity names ####
tidyActivitydb$activity <- factor(tidyActivitydb$activity,
                                  levels = activities[,1],
                                  labels = activities[,2])

#### Write tidyActivitydb to a file ####
write.table(tidyActivitydb, "tidy_activity.txt", row.names = FALSE, quote = FALSE)
