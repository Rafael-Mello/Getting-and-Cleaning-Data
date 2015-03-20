This is the codebook for the course project. It describes the original data set and the transformations 
  done by the run_analysis.R script.
  
The following description of the original files was obtained in the readme.txt included in the data set:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
	Its range is from 1 to 30. 
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. 
	Its range is from 1 to 30. 

The 'test' and 'training' sets have a group of variables, including the mean value and the standard deviation,
	estimated from the following signals, as described in the features_info.txt that is also available with 
	the dataset ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):  
		
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
Note: Other variables available in the data set were not considered in this project.

The only variables of interest for this project are the mean and standard values, so the script work with smaller 
	sets, created selecting only the variables containing ".mean." or ".std.". The activity labels and subject 
	identifiers are also added as new variables.
		
The 'test' and 'training' sets are then merged together, and the descriptive activity names are added to this 
	new 'complete' data set.
	
Finally, this complete set is melted, "grouping" by subject and activity, and then casted to a new independent data 
	set with the average of each variable for each activity and each subject. This final data set is saved as 
	"tidy.txt". 
		
