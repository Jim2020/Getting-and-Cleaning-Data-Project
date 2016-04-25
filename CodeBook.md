# CodeBook for Getting And Cleaning Data Project

## Input Data: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A description of the data files can be found in the accompanying txt files.

## Full Description of Input Data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Transformations performed by run_analysis.R:
### Get the data
- Download and unzip input data
- Read the activity files found in ./data/train/y_train.txt and ./data/test/y_test.txt
- Read the subject files found in ./data/train/subject_train.txt and ./data/test/subject_test.txt
- Read the measured feature data found in ./data/train/X_train.txt and ./data/test/X_test.txt

### Merge the training and test data sets to create one data set
- Concatenate the data tables by rows
- Set names to the variables for subject, activity, and the feature names provided by the input
- Merge all the columns 

### Extract only the measurements on the mean and standard deviation for each measurement
- Subset the feature names based on "mean" and "std"
- Subset the full data set by the names of the features

### Apply the descriptive activity names 
- Read the input file with the activity name labels
- Convert all the activity ID numbers to the labels in the data set

### Label the data set with descriptive variable names

### Create a tidy data set with the average of each variable for each activity and subject
- Determine the average of each variable for each activity and each subject
- Order by subject, then activity
- Save the new tidy data set in a file named tidydata.txt

## SUBJECTS
Individuals with identifiers 1 - 30

## ACTIVITIES
There are 6 activities:

1. WALKING

2. WALKING_UPSTAIRS

3. WALKING_DOWNSTAIRS

4. SITTING

5. STANDING

6. LAYING

## VARIABLES 
"timeBodyAccelerometer-mean()-X"                
"timeBodyAccelerometer-mean()-Y"                
"timeBodyAccelerometer-mean()-Z"                
"timeBodyAccelerometer-std()-X"                 
"timeBodyAccelerometer-std()-Y"                 
"timeBodyAccelerometer-std()-Z"                 
"timeGravityAccelerometer-mean()-X"             
"timeGravityAccelerometer-mean()-Y"             
"timeGravityAccelerometer-mean()-Z"             
"timeGravityAccelerometer-std()-X"              
"timeGravityAccelerometer-std()-Y"              
"timeGravityAccelerometer-std()-Z"              
"timeBodyAccelerometerJerk-mean()-X"            
"timeBodyAccelerometerJerk-mean()-Y"            
"timeBodyAccelerometerJerk-mean()-Z"            
"timeBodyAccelerometerJerk-std()-X"             
"timeBodyAccelerometerJerk-std()-Y"             
"timeBodyAccelerometerJerk-std()-Z"             
"timeBodyGyroscope-mean()-X"                    
"timeBodyGyroscope-mean()-Y"                    
"timeBodyGyroscope-mean()-Z"                    
"timeBodyGyroscope-std()-X"                     
"timeBodyGyroscope-std()-Y"                     
"timeBodyGyroscope-std()-Z"                     
"timeBodyGyroscopeJerk-mean()-X"                
"timeBodyGyroscopeJerk-mean()-Y"                
"timeBodyGyroscopeJerk-mean()-Z"                
"timeBodyGyroscopeJerk-std()-X"                 
"timeBodyGyroscopeJerk-std()-Y"                 
"timeBodyGyroscopeJerk-std()-Z"                 
"timeBodyAccelerometerMagnitude-mean()"         
"timeBodyAccelerometerMagnitude-std()"          
"timeGravityAccelerometerMagnitude-mean()"      
"timeGravityAccelerometerMagnitude-std()"       
"timeBodyAccelerometerJerkMagnitude-mean()"     
"timeBodyAccelerometerJerkMagnitude-std()"      
"timeBodyGyroscopeMagnitude-mean()"             
"timeBodyGyroscopeMagnitude-std()"              
"timeBodyGyroscopeJerkMagnitude-mean()"         
"timeBodyGyroscopeJerkMagnitude-std()"          
"frequencyBodyAccelerometer-mean()-X"           
"frequencyBodyAccelerometer-mean()-Y"           
"frequencyBodyAccelerometer-mean()-Z"           
"frequencyBodyAccelerometer-std()-X"            
"frequencyBodyAccelerometer-std()-Y"            
"frequencyBodyAccelerometer-std()-Z"            
"frequencyBodyAccelerometerJerk-mean()-X"       
"frequencyBodyAccelerometerJerk-mean()-Y"       
"frequencyBodyAccelerometerJerk-mean()-Z"       
"frequencyBodyAccelerometerJerk-std()-X"        
"frequencyBodyAccelerometerJerk-std()-Y"        
"frequencyBodyAccelerometerJerk-std()-Z"        
"frequencyBodyGyroscope-mean()-X"               
"frequencyBodyGyroscope-mean()-Y"               
"frequencyBodyGyroscope-mean()-Z"               
"frequencyBodyGyroscope-std()-X"                
"frequencyBodyGyroscope-std()-Y"                
"frequencyBodyGyroscope-std()-Z"                
"frequencyBodyAccelerometerMagnitude-mean()"    
"frequencyBodyAccelerometerMagnitude-std()"     
"frequencyBodyAccelerometerJerkMagnitude-mean()"
"frequencyBodyAccelerometerJerkMagnitude-std()" 
"frequencyBodyGyroscopeMagnitude-mean()"        
"frequencyBodyGyroscopeMagnitude-std()"         
"frequencyBodyGyroscopeJerkMagnitude-mean()"    
"frequencyBodyGyroscopeJerkMagnitude-std()"     
