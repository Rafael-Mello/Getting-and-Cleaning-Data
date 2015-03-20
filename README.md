Getting and Cleaning Data - Course Project

This repo was created to archive and share my work for the course project.
The purpose of the project is to collect and clean a data set. The data provided represent data collected from the accelerometers from the Samsung Galaxy S smartphone, and can be obtained in this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The assignment was to create a R script called run_analysis.R that does the following: 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in the step above, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

For the script in this repo to work properly, the data should be unzipped in a directory called "UCI HAR Dataset" saved in the working directory. Also, the "dplyr" and "reshape2" packages should be installed.

The original data is divided in a few different files. Please refer to the codebook in this repo to get more information about these files. 

The script in this repo doesn't follow the steps stated above in the same order, as can be seen in its #comments#: 
- The variable labels are assigned as the data sets are read;
- Then, smaller sets are created, extracting only the 'mean' and 'standard deviation' variables;
- The smaller data sets are then merged;
- Then, the descriptive activity names are assigned
- And finally, the new "tidy" data set is created.

To read the file back into R, use the following commands:
data <- read.table("tidy.txt", header = TRUE)
View(data)

I thank TA David Hood for all the useful information about this project, available in the "David's personal course project FAQ" Forum thread.
