CodeBook for data used in Project of Cousera course "Getting and Cleaning Data"


1. introduction
The data used in this assigment is described in details in 3a and 3b.
Short description:
subject files(test and training): 
Columns: one 
Type: integer 
Descrition: each integer is a identifier code for a test subject

X files(test and training):
Columns: 561
Type: Numeric (normalized and bounded within [-1,1])
Description: Data recorded (561-feature vector with time and frequency domain variables)

y files(test and training):
Columns: 1
Type: integer
Description: each integer is an identifier code for activity  

2. Processing
each pair of files are merged using rbind
train files: 7352 obs
test  files: 2947 obs
merged files:10299 rows

X file column names are added from features.txt
A filter is applied to get only columns with mean and sd data resulting in 66 columns out of original 561

y file: intger code for activity is replaced with a descriptive text label

Subject data: a desciptive col name is added
Columnames are cleaned up and made more descriptive

X,y and subject files are bound together with cbind rswulting in a 68 column dataframe with 66 columns of feature data (Numerial), one column of activity data (Factor) and one column of subject data(Int)

calculating the mean of feature data columns (of each variable for each activity and each subject) results in:

data.frame':	180 obs. of  68 variables:
 $ subject                           : int  1 1 1 1 1 1 2 2 2 2 ...
 $ activity                          : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...
 $ TimeBodyAccMean-X                 : num  0.222 0.261 0.279 0.277 0.289 ...
 $ TimeBodyAccMean-Y                 : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
 $ TimeBodyAccMean-Z                 : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
 $ TimeBodyAccStdDev-X               : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
 $ TimeBodyAccStdDev-Y               : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
 $ TimeBodyAccStdDev-Z               : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
 $ TimeGravityAccMean-X              : num  -0.249 0.832 0.943 0.935 0.932 ...
 $ TimeGravityAccMean-Y              : num  0.706 0.204 -0.273 -0.282 -0.267 ...
 $ TimeGravityAccMean-Z              : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...
 $ TimeGravityAccStdDev-X            : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...
 $ TimeGravityAccStdDev-Y            : num  -0.908 -0.936 -0.981 -0.971 -0.937 ...
 $ TimeGravityAccStdDev-Z            : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...
 $ TimeBodyAccJerkMean-X             : num  0.0811 0.0775 0.0754 0.074 0.0542 ...
 $ TimeBodyAccJerkMean-Y             : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...
 $ TimeBodyAccJerkMean-Z             : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
 $ TimeBodyAccJerkStdDev-X           : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
 $ TimeBodyAccJerkStdDev-Y           : num  -0.924 -0.981 -0.986 0.067 -0.102 ...
 $ TimeBodyAccJerkStdDev-Z           : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...
 $ TimeBodyGyroMean-X                : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
 $ TimeBodyGyroMean-Y                : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
 $ TimeBodyGyroMean-Z                : num  0.1487 0.0629 0.0748 0.0849 0.0901 ...
 $ TimeBodyGyroStdDev-X              : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...
 $ TimeBodyGyroStdDev-Y              : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
 $ TimeBodyGyroStdDev-Z              : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...
 $ TimeBodyGyroJerkMean-X            : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
 $ TimeBodyGyroJerkMean-Y            : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
 $ TimeBodyGyroJerkMean-Z            : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
 $ TimeBodyGyroJerkStdDev-X          : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...
 $ TimeBodyGyroJerkStdDev-Y          : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...
 $ TimeBodyGyroJerkStdDev-Z          : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...
 $ TimeBodyAccMagMean                : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ TimeBodyAccMagStdDev              : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 $ TimeGravityAccMagMean             : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ TimeGravityAccMagStdDev           : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 $ TimeBodyAccJerkMagMean            : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
 $ TimeBodyAccJerkMagStdDev          : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
 $ TimeBodyGyroMagMean               : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
 $ TimeBodyGyroMagStdDev             : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...
 $ TimeBodyGyroJerkMagMean           : num  -0.963 -0.992 -0.995 -0.299 -0.295 ...
 $ TimeBodyGyroJerkMagStdDev         : num  -0.936 -0.988 -0.995 -0.325 -0.307 ...
 $ FrequencyBodyAccMean-X            : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
 $ FrequencyBodyAccMean-Y            : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
 $ FrequencyBodyAccMean-Z            : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...
 $ FrequencyBodyAccStdDev-X          : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
 $ FrequencyBodyAccStdDev-Y          : num  -0.834 -0.917 -0.972 0.056 -0.113 ...
 $ FrequencyBodyAccStdDev-Z          : num  -0.813 -0.934 -0.978 -0.28 -0.298 ...
 $ FrequencyBodyAccJerkMean-X        : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
 $ FrequencyBodyAccJerkMean-Y        : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
 $ FrequencyBodyAccJerkMean-Z        : num  -0.948 -0.986 -0.991 -0.469 -0.288 ...
 $ FrequencyBodyAccJerkStdDev-X      : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
 $ FrequencyBodyAccJerkStdDev-Y      : num  -0.932 -0.983 -0.987 0.107 -0.135 ...
 $ FrequencyBodyAccJerkStdDev-Z      : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...
 $ FrequencyBodyGyroMean-X           : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...
 $ FrequencyBodyGyroMean-Y           : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
 $ FrequencyBodyGyroMean-Z           : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
 $ FrequencyBodyGyroStdDev-X         : num  -0.882 -0.978 -0.987 -0.517 -0.495 ...
 $ FrequencyBodyGyroStdDev-Y         : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
 $ FrequencyBodyGyroStdDev-Z         : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...
 $ FrequencyBodyAccMagMean           : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
 $ FrequencyBodyAccMagStdDev         : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...
 $ FrequencyBodyBodyAccJerkMagMean   : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
 $ FrequencyBodyBodyAccJerkMagStdDev : num  -0.922 -0.982 -0.993 -0.103 -0.104 ...
 $ FrequencyBodyBodyGyroMagMean      : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
 $ FrequencyBodyBodyGyroMagStdDev    : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...
 $ FrequencyBodyBodyGyroJerkMagMean  : num  -0.942 -0.99 -0.995 -0.319 -0.282 ...
 $ FrequencyBodyBodyGyroJerkMagStdDev: num  -0.933 -0.987 -0.995 -0.382 -0.392 ... 


 
3. excerpts from UCI HAR Dataset description files.

a)
------------- readme.txt snip begin --------------

Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

----------------readme.txt snip end -----------------

b)
--------------- Features_info.txt snip begin ------------

=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

--------------- Features_info.txt snip end -----------------------------------------------------

