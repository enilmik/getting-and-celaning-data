Getting and Cleaning Data - Course Project

This repository holds the project R code and documentation files for the Cousera course "Getting and Cleaning data"

Files:
--------------------------------------
README.md:       	      This file
run_analysis.R:		R script
CodeBook.md:		Description of the variables, the data, and any transformations that was performed to clean up the data
tidydata.txt:           Resultfile generated by the script

run_analysis.R:
The R script file download and unpack the data for the project in the working directory then the data is processed:

Step 1.
First  test and train file pairs er merged with rbind
Step 2.
Featurenames are read, and used to set column names of the X data
X columns are filtered som only columns with mean or sd are selected using grep.
Step 3.
Activity labels are read and inter value of y data is replaced with text label.
Step 4.
Column names of subject data and X data are madre more descriptive / readable using gsub
X, y and subject data are bound together using cbind 
Step 5. 
average of each variable for each activity and each subject are calculated usling ddply and colMeans
A tinydata.txt file is saved in the working directory using write.table.

See script file for more details. 