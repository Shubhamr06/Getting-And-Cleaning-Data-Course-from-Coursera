# Variables
* subject -- 30 volunteers tested for the dataset
* activity -- There are 6 different activities are test in the dataset (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Number 1-6 represents them orderly.
* features (measurements) --
`tBodyAcc-XYZ`
`tGravityAcc-XYZ`
`tBodyAccJerk-XYZ`
`tBodyGyro-XYZ`
`tBodyGyroJerk-XYZ`
`tBodyAccMag`
`tGravityAccMag`
`tBodyAccJerkMag`
`tBodyGyroMag`
`tBodyGyroJerkMag`
`fBodyAcc-XYZ`
`fBodyAccJerk-XYZ`
`fBodyGyro-XYZ`
`fBodyAccMag`
`fBodyAccJerkMag`
`fBodyGyroMag`
`fBodyGyroJerkMag`
* The meaning of features --
  * t: time
  * f: frequency
  * Acc: acceleration
  * AccJerk: acceleration jerk (derivation of the acceleration in time)
  * Gyro: angular velocity
  * GyroJerk: angular velocity jerk (derivation of the angular velocity in time)
  * XYZ: X, Y, Z directions
  * Mag: magnitude
* Modified features --
  * Substitue "-" to space
  * Substitue "std" to "standard deviation"
  * Substitue "^t" to "time domain"
  * Substitue "^f" to "frequency domain"
  * Substitue "Jerk" to jerk signal
  * Substitue "Gyro" to "gyroscope"
  * Substitue "BodyBody" to "Body"
  * Substitue "Mag" to "Euclidean norm"
