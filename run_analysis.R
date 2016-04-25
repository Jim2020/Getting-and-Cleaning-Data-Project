############################################
# GETTING AND CLEANING DATA COURSE PROJECT #
############################################
# Create an R script to get and clean a data set for measured 
# human activity from smartphone accelerometers.  Create a new
# tidy data set based on the original raw data.

###################################################################
# STEP 1: MERGE THE TRAINING AND TEST SETS TO CREATE ONE DATA SET #
###################################################################

# Get the data and unzip it
if (!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/Dataset.zip",method="curl")
unzip(zipfile="./data/Dataset.zip",exdir="./data")
data_dir <- file.path("./data" , "UCI HAR Dataset")

# Read the Activity files
dataActivityTrain <- read.table(file.path(data_dir, "train", "y_train.txt"),
                                header = FALSE)
dataActivityTest  <- read.table(file.path(data_dir, "test" , "y_test.txt" ),
                                header = FALSE)

# Read the Subject files
dataSubjectTrain <- read.table(file.path(data_dir, "train", "subject_train.txt"),
                                header = FALSE)
dataSubjectTest  <- read.table(file.path(data_dir, "test" , "subject_test.txt" ),
                                header = FALSE)

# Read the Feature (measured data) files
dataFeaturesTrain <- read.table(file.path(data_dir, "train", "X_train.txt"),
                               header = FALSE)
dataFeaturesTest  <- read.table(file.path(data_dir, "test" , "X_test.txt" ),
                               header = FALSE)

# Concatenate the data tables by rows
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

# Set names to variables
names(dataActivity)<- c("activity")
names(dataSubject)<-c("subject")
dataFeaturesNames <- read.table(file.path(data_dir, "features.txt"),header=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

# Merge all the columns to create one data set
dataSubjectAndActivity <- cbind(dataSubject, dataActivity)
dataSet <- cbind(dataFeatures, dataSubjectAndActivity)

################################################################################
# STEP 2: EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR #
#         EACH MEASUREMENT                                                     #
################################################################################

# Get only those feature names containing "mean()" or "std()"
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

# Subset the full data set by the selected names of Features
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
dataSet<-subset(dataSet,select=selectedNames)

#################################################################
# STEP 3: USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES # 
#         IN THE DATA SET                                       #
#################################################################

# Read the file with the descriptive activity names
activityLabels <- read.table(file.path(data_dir, "activity_labels.txt"),header = FALSE)

# Convert activity numbers to labels
dataSet$activity <- factor(dataSet$activity, labels=activityLabels$V2)

##############################################################
# STEP 4: LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES #
##############################################################

# Replace prefix "t" with "time"
names(dataSet)<-gsub("^t", "time", names(dataSet))

# Replace prefix "f" with "frequency"
names(dataSet)<-gsub("^f", "frequency", names(dataSet))

# Replace other abbreviations with full word names
names(dataSet)<-gsub("Acc", "Accelerometer", names(dataSet))
names(dataSet)<-gsub("Gyro", "Gyroscope", names(dataSet))
names(dataSet)<-gsub("Mag", "Magnitude", names(dataSet))

# Replace "BodyBody" with "Body"
names(dataSet)<-gsub("BodyBody", "Body", names(dataSet))

#########################################################################
# STEP 5: CREATE A SECOND INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF #
#         EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT              #
#########################################################################

# Determine the average of each variable for each activity and subject
tidyDataSet2 <- aggregate(. ~subject + activity, dataSet, mean)

# Order by subject, then activity
tidyDataSet2 <- tidyDataSet2[order(tidyDataSet2$subject,tidyDataSet2$activity),]

# Save the data set in a new file
write.table (tidyDataSet2, file = "tidydata.txt", row.name=FALSE)

# DONE