# Code Book for run_analysis.R

## Variable Description

- y: activity label
- subject: subject id
- X: measurements of 3 axial linear acceleration and 3 axial angular velocity. The summary statistics (i.e. mean, min, etc.) are recorded instead of the original observations.

## Activity Labels

- 1: WALKING
- 2: WALKING_UPSTAIRS
- 3: WALKING_DOWNSTAIRS
- 4: SITTING
- 5: STANDING
- 6: LAYING

## Variable selection mechanism

The project requires extracting measurements for mean and standard deviation. These measurements all have name containing strings "mean" or "std". The method I used to extract these measurements is by using function grep("mean(std)",x) to search for the measurement names that containing the two strings above. The resulting measurements are included in the final data set.

## Column labeling mechanism

The features read in from the external file contains strings that are not legal variable in R. However, we found that the feature names are very self-explanatory already. Therefore, we just convert the features to be legal R variable names using make.name() function. The function automatically convert the punctuations to "." so that the strings are legal R variable names. 

## Working directory

The code would first assign the working directory. The working directory should be set to the directory that contains the folder of downloaded files ("UCI HAR Dataset").

## Assign descriptive activity name

The merge() function iis utilized to assign descriptive activity name to the final data set. This is accomplished by matching the activity label in the raw data set (given by y) and the label in activity_labels.txt file. 

## Summary Data Table

A summary data set containing averages of all SELECTED measurements by activity and subject is generated at the end of the code. Aggregate function is applied here for the group mean calculation.

