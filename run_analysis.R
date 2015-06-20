
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