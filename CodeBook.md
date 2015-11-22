# Codebook

## Input Data
The input consists of the Samsung accelerometer data found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
This is an excerpt of the included description of input variables:
 
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

## Output Variables

subject: Id of the subject testing the device
activity: Description of the activity performed by the subject

These variables display the means per subject and activity of the variables described above

tBodyAcc.mean...
tGravityAcc.mean...
tBodyAccJerk.mean...
tBodyGyro.mean...
tBodyGyroJerk.mean...
tBodyAccMag.mean.. 
tGravityAccMag.mean.. 
tBodyAccJerkMag.mean.. 
tBodyGyroMag.mean.. 
tBodyGyroJerkMag.mean.. 
fBodyAcc.mean...
fBodyAcc.meanFreq...
fBodyAccJerk.mean...
fBodyAccJerk.meanFreq...
fBodyGyro.mean...
fBodyGyro.meanFreq...
fBodyAccMag.mean.. 
fBodyAccMag.meanFreq.. 
fBodyBodyAccJerkMag.mean.. 
fBodyBodyAccJerkMag.meanFreq.. 
fBodyBodyGyroMag.mean.. 
fBodyBodyGyroMag.meanFreq.. 
fBodyBodyGyroJerkMag.mean.. 
fBodyBodyGyroJerkMag.meanFreq.. 
tBodyAcc.std... 
tGravityAcc.std...
tBodyAccJerk.std...
tBodyGyro.std...
tBodyGyroJerk.std...
tBodyAccMag.std.. 
tGravityAccMag.std.. 
tBodyAccJerkMag.std.. 
tBodyGyroMag.std.. 
tBodyGyroJerkMag.std.. 
fBodyAcc.std...
fBodyAccJerk.std...
fBodyGyro.std...
fBodyAccMag.std.. 
fBodyBodyAccJerkMag.std.. 
fBodyBodyGyroMag.std.. 
fBodyBodyGyroJerkMag.std..

## Transformations

In a first step, the measurement variables and activity variables as well as the subject identifiers were consolidated for the training
and test data set and then merged into one data set. Hereby, the activity ids and variables were matched via their ids.

In the second step, only measurement variables containing "mean" or "std" along with the activity and subject variables were extracted
for further processing.

Thirdly, the data was melted to a long data format in order to prepare the subsequent casting step. Here, the data was summarized by 
calculating the mean of each column for each subject and activity. This corresponds also to the final output. 

Finally, the output data set was written to the output file
