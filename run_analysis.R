## Read in data files
setwd("/Users/xinzhang/Documents/dataScience/dataProcess")
## train sample
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
## test sample
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
## feature list and activity list
features <- read.table("./UCI HAR Dataset/features.txt")
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")


## 1. Merge the training and testing dataset to create one data set
##    Assign column names for each of the column
xAll <- rbind(xTrain, xTest)
yAll <- rbind(yTrain, yTest)
subjectAll <- rbind(subjectTrain, subjectTest)


## 2. Extracts the measurements on the mean and std for each measurements
meanIndex <- grep("mean", as.character(features[,2]))
stdIndex <- grep("std",as.character(features[,2]))
index <- c(meanIndex, stdIndex)
xFinal <- xAll[,index]
data <- data.frame(subjectAll, yAll, xFinal)

## 4. Uses appropriate labels for data set columns
colName <- tolower(make.names(as.character(features[,2])[c(index)]))
colNameFinal <- c("subject", "activity", colName)
names(data) <- colNameFinal

## 3. Use descriptive activity names in the data set.
names(activity) <- c("actLabel","activityName")
dataTemp <- merge(activity, data, by.x="actLabel", by.y="activity", y.all=TRUE)
dataFinal <- dataTemp[,-1]
colnames(dataFinal)[1]<-"activity"
dataFinal <- dataFinal[order(dataFinal$subject),]

## 5. Create tidy data set with the average of each selected variable for
##    each activity and each subject.
avgData <- aggregate(dataFinal[,3:ncol(dataFinal)],by=list(dataFinal$activity,dataFinal$subject),mean,na.rm=TRUE)
colnames(avgData)[1:2]<-c("activity","subject")
write.table(avgData,"avgData.txt")



