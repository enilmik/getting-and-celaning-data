
# run_analysis.R - scriptfile for Course Project on Cousera "Getting and cleaning Data"
#Step 0.  Downloading and unzipping dataset
#Download
if(!file.exists("./data")){dir.create("./data")} 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile="./data/Dataset.zip"
if(!file.exists("./data/Dataset.zip")){download.file(fileUrl,destfile=destfile)}
#Unzip
datasetDir <- "./UCI HAR Dataset"
if(!file.exists(datasetDir)) { unzip(destfile, exdir = ".") }

#Step 1. Merge test and training datasets and merge them into one

# read data files assumed to be in working directory:

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# merge data sets using rbind

# X data merged
X_data <- rbind(X_train, X_test) 

# y data merged
y_data <- rbind(y_train, y_test)

# subject data merged
subject_data <- rbind(subject_train, subject_test)

# Step 2. Only extract the measurements on the mean and standard deviation for each measuemrent

# Read column names
featureNames <- read.table("UCI HAR Dataset/features.txt")[,2]

names(X_data) <- featureNames

mean_and_std_columnfilter <- grep("-(mean|std)\\(\\)",featureNames)

# apply column filter on X_data
X_data <- X_data[, mean_and_std_columnfilter]

# Step 3.  Use descriptive activity names to name the activities in the data set 

#Read acivities
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# Substitute number with activity name
y_data[, 1] <- activities[y_data[, 1], 2]
# Label coumn name properly
names(y_data) <- "activity"

# Step 4. Appropriately labels the data set with descriptive variable names

# Label column name properly for subejct_data
names(subject_data) <- "subject" 

# Clean X_data names, features_info.txt: prefix t = Time, prefix f = Frequency
# use gsub and regex to change t to Time, f to Frequency
names(X_data) <- gsub("^t", "Time", names(X_data))
names(X_data) <- gsub("^f", "Frequency", names(X_data))

# get rid of parantheis in stat functions
names(X_data) <- gsub("-std\\(\\)", "StdDev", names(X_data))
names(X_data) <- gsub("-mean\\(\\)", "Mean", names(X_data))
# names(X_data)

# Use cbind to bind all the data in a single data set
alldata <- cbind(X_data, y_data, subject_data) 
