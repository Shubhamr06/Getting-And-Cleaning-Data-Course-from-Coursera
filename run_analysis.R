#Set working directory
setwd()

#Load and merage datasets
train <- read.table("./train/X_train.txt")
test <- read.table("./test/X_test.txt")
all <- rbind(train, test)

trainlabelactivity <- read.table("./train/y_train.txt")
testlabelactivity <- read.table("./test/y_test.txt")
allactivity <- rbind(trainlabelactivity, testlabelactivity)
allactivity <- rename(allactivity, activity = V1)

trainsubject <- read.table("./train/subject_train.txt")
testsubject <- read.table("./test/subject_test.txt")
allsubject <- rbind(trainsubject, testsubject)
allsubject <- rename(allsubject, subject = V1)        
subjectactivity <- cbind(allsubject, allactivity)
alldata <- cbind(all, subjectactivity)

#Load feature label and add it to dataset
feature <- read.table("features.txt")
feature[, 2] <- as.character(feature[, 2])
colnames(alldata) <- c(feature[, 2], "subject", "activity")

#Extract meand and std columns
alldata <- alldata[, grep("mean\\(\\)|std\\(\\)|subject|activity", colnames(alldata))]

#Substitute activity number with activity name
activitylabel <- read.table("activity_labels.txt")
alldata$activitylabel <- factor(alldata$activity, levels = activitylabel[, 1], labels = activitylabel[,2])

#Appropriately labels the data set with descriptive variable names.
modify <- colnames(alldata)
modify <- gsub("-"," ", modify)
modify <- gsub("std","standard deviation", modify)
modify <- gsub("^t","time domain_", modify)
modify <- gsub("std","standard deviation", modify)
modify <- gsub("^t","time domain_", modify)
modify <- gsub("Acc","_acceleration", modify)
modify <- gsub("Jerk","_jerk signal", modify)
modify <- gsub("^f","frequency domain_", modify)
modify <- gsub("Mag","_Euclidean norm", modify)
modify <- gsub("Gyro","_gyroscope", modify)
modify <- gsub("BodyBody", "Body", modify)
colnames(alldata) <- modify

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
alldataFinal <- melt(alldata, id=c("subject", "activitylabel"))
write.table(alldataFinal, "tidydata.txt")
