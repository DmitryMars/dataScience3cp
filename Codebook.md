# Codebook

Variables in resulting dataset:
- subject - a subject of experiment
- activity - a type of activity, performed by subject. This variable could have one of the following values:  
  WALKING  
  WALKING_UPSTAIRS  
  WALKING_DOWNSTAIRS  
  SITTING  
  STANDING  
  LAYING  
- measurement - a type of measure for each activity. Name of the measurements have the following format:  
   **{signal}**.**{method}**...**{axis}**, where:  
  * **{signal}** - signals from accelerometer and gyroscope. Have following values:  
   tBodyAcc-XYZ  
   tGravityAcc-XYZ  
   tBodyAccJerk-XYZ  
   tBodyGyro-XYZ  
   tBodyGyroJerk-XYZ  
   tBodyAccMag  
   tGravityAccMag  
   tBodyAccJerkMag  
   tBodyGyroMag  
   tBodyGyroJerkMag  
   fBodyAcc-XYZ  
   fBodyAccJerk-XYZ  
   fBodyGyro-XYZ  
   fBodyAccMag  
   fBodyAccJerkMag  
   fBodyGyroMag  
   fBodyGyroJerkMag  
  * **{method}** - how those signals were estimated into variables. For this project it can be:  
   mean: Mean value  
   std: Standard deviation  
  * **{axis}** - X, Y or Z direction of measurement
- average - average value for each subject, activity and measurement. Normalized double-precision number. 
