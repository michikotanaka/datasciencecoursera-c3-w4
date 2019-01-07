# Code Book

## Data
The original data is here : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This R script create tidy data which contains means of following variables over test and train data. 
- timeDomain-BodyAcc-XYZ
- timeDomain-GravityAcc-XYZ
- timeDomain-BodyAccJerk-XYZ
- timeDomain-BodyGyro-XYZ
- timeDomain-BodyGyroJerk-XYZ
- timeDomain-BodyAccMag
- timeDomain-GravityAccMag
- timeDomain-BodyAccJerkMag
- timeDomain-BodyGyroMag
- timeDomain-BodyGyroJerkMag
- frequencyDomain-BodyAcc-XYZ
- frequencyDomain-BodyAccJerk-XYZ
- frequencyDomain-BodyGyro-XYZ
- frequencyDomain-BodyAccMag
- frequencyDomain-BodyAccJerkMag
- frequencyDomain-BodyGyroMag
- frequencyDomain-BodyGyroJerkMag

## Transformations
The transformations done over the original data is as follow.
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
