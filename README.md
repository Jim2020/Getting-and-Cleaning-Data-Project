# Getting-and-Cleaning-Data-Project
Getting and Cleaning Data Course Project

The data linked to from the course website represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

run_analysis.R script downloads data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
This script performs the following steps:

1 - Merges the training and the test sets to create one data set.
2 - Extracts only the measurements on the mean and standard deviation for each measurement.
3 - Uses descriptive activity names to name the activities in the data set
4 - Appropriately labels the data set with descriptive variable names.
5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  The output file is called tidydata.txt.

