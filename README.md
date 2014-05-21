# Data Science Specialization 
## Data Process Course Project

The project involves cleaning and preprocessing the Human Activity Recognition Using Smartphones Dataset Version 1.0. The data set could be found at 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data could be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## Human Activity Recognition Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

For both training data and test data, we concentrate on three files. namely "X_train(test).txt", "y_train(test).txt", and "subject_train(test).txt". These three files provide information:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Data Cleaning R Script
The R script ("run_analysis.R") contains six parts in the main body. 
-Read in data files
In this part of the code, we first set the working directory to the directory that includes the data. Then read.table functions are executed to read in the training/test data, as well as the features and activity.
-Merge training and test data
This part combines the training and test data to form one data set.
-Extract the measurements on the mean and standard deviation for each measurement.
This part of the code extracts the measurement on the mean and standard deviation. The details could be found in the CodeBook.md
-Assign appropriate column names
This part of the code assigns appropriate column names for each of the column. The reason is that the original wording of the features are not legal names for R.
-Use descriptive activity names
The data set so far has the activity label (y_train(test)) for each of the record. This sometimes is not clear for future data users if there is not a look up table for activity label and activity. So we here use descriptive activity names in the data set instead of the activity label.
-Create tidy data set with the average of each selected variable from above steps by each activity and each subject.
A new data set is created to summarize the data set we obtained above. The average of each selected variable is calculated for each activity and each subject.
