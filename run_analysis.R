## put this script with UCI HAR Dataset folder
setwd("UCI HAR Dataset/")

## loading tables header
header <- read.table("features.txt", sep = " ", header = FALSE)

## loading tables
train <- read.table("train//X_train.txt", sep="", header=FALSE, 
                    col.names = header[,2])
test <- read.table("test//X_test.txt", sep="", header=FALSE, 
                   col.names = header[,2])

## loading activities columns
train_activities <- read.table("train//y_train.txt", sep="", 
                               header=FALSE, col.names=c("activity"))
test_activities <- read.table("test//y_test.txt", sep="", 
                              header=FALSE, col.names=c("activity"))

## loading subject columns
subject_train <- read.table("train//subject_train.txt", header=FALSE,
                            col.names=c("subject"))
subject_test <- read.table("test//subject_test.txt", header=FALSE,
                            col.names=c("subject"))

## binding activities and subjects with their measurments tables
train <- dplyr::bind_cols(train, train_activities, subject_train)
test <- dplyr::bind_cols(test, test_activities, subject_test)

## binding together test and train tables
ds <- dplyr::bind_rows(train, test)
rm(list=c("test", "train", "train_activities", "test_activities", "header", 
          "subject_test", "subject_train"))

## extracting means and std columns for measurments
ds_mean_sd <- dplyr::select(ds, subject, activity, contains("mean"), contains("std"), 
                            -contains("meanFreq"), -contains("angle"))
rm("ds")

## reading human-readable activity labels
activity_labels <- read.table("activity_labels.txt", sep="", header=FALSE, 
                              stringsAsFactors=FALSE)

## replacing numeric activity labels with human-readable form
ds_mean_sd <- dplyr::mutate(ds_mean_sd, 
                                  activity=plyr::mapvalues(activity, 
                                    activity_labels[,1], activity_labels[,2]))
rm("activity_labels")

## making new tidy data set with 4 columns (activity, subj, measurement, value)
ds_tidy <- tidyr::gather(ds_mean_sd, measurement, value, -c(activity, subject))

## grouping this dataset by  subject, activity and measurement
ds_tidy <- dplyr::group_by(ds_tidy, subject, activity, measurement)

## summarising dataset
ds_tidy <- dplyr::summarise(ds_tidy, average=mean(value))

## saving results
setwd("..")
write.table(x=ds_tidy, file="tidy_result.txt", row.names=FALSE)
