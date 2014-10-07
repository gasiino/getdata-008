Code Book
===========

This document describes transformations performed in the code to obtain a clean dataset.

Considerations about the raw data:

Raw data has no helpful labels. Data is stored using a positional pattern so the hundreds of columns related to the features are valid only if the features description is in the same order as the columns. 

The labelling we have chosen is explained later on in this document.

Data comes with train and test sets but for the sake of this exercise, they are merged together in a unique dataset.

##1. Merge the training and the test sets to create one data set.

### get zip file 
download file - this is a step that can be avoided if the zip file is already available.
However the following step assumes the file in the same current folder with name "UCI HAR Dataset.zip"

###unzip the file
files are unzipped in current folder as the zip file contains a folder "UCI HAR Dataset"

### load data

the following files are loaded into variables with the same name as the file (without extension) using read.table with header=FALSE

<li>subject_test.txt</li>
<li>x_test.txt</li>
<li>y_test.txt</li>
<li>subject_train.txt</li>
<li>x_train.txt</li>
<li>y_train.txt</li>

test data frames have 2947 rows 

train data frames have 7352 rows

subject data frames contain the subject that has performed the activity for  each observation (1 column only)

y data frames contain the activity code per each obesrvation (1 column only)

x data frames contain all the values for the many variables related to each observation (561 columns)

### putting data together

We create one data frame for all the train data, using the columns for the subject (from subject_train), for the activity code (from y_train) a type ("train" for all the rows) and all the values from the observations (from x_train). The new dataframe has 7352 rows and 564 columns.

We also create one data frame for all the test data, using the columns for the subject (from subject_test), for the activity code (from y_test) a type ("test" for all the rows) and all the values from the observations (from x_test). The new dataframe has 2947 rows and 564 columns.

Last, we merge together these two data frames using rbind.

Our dataset contains now 10299 observations of 564 variables.

##2. Extract only the measurements on the mean and standard deviation for each measurement. 

### retrieve the features
we retrieve the features from the file features.txt

We create from it a data frame by decomposing the names we find, to identify a signal, variable and direction related to each feature. 

we also give a name to each feature using the pattern featureN where N is its order number.
There are 561 features.


### filter only the measurements for mean and std
We select only the features with signal equal to "mean()" and "std()" and we give them their original name back (concatenation of signal, variable and direction).

Therefore all the other features (not mean or std) will keep name in the form "featureN".

Because the order of the features is the same as the observation columns of our dataset, we use the subset of columns containing "feature" in the name to remove all the columns that are not required.

Our dataset becomes a data frame of 10299 observations of 69 variables.

##3. Use descriptive activity names to name the activities in the data set

So far the activities have been expressed with a code.

We retrieve the activity names from the file activity_labels.txt and we replace the code with the actual name of the activity. 

The activities are the following:
<ul>
<li>WALKING</li>
<li>WALKING_UPSTAIRS</li>
<li>WALKING_DOWNSTAIRS</li>
<li>SITTING</li>
<li>STANDING</li>
<li>LAYING</li>
</ul>

##4. Appropriately label the data set with descriptive variable names. 

So far the dataset had non-relevant column names.

We assign proper column names.

The first three column will be "subject","activity","type".

The following columns will have the name of the feature, as already stored in the features data frame.

These are the column names:
<ol>
<li>subject</li>
<li>activity</li>
<li>type</li>
<li>tBodyAcc-mean()-X</li>
<li>tBodyAcc-mean()-Y</li>
<li>tBodyAcc-mean()-Z</li>
<li>tBodyAcc-std()-X</li>
<li>tBodyAcc-std()-Y</li>
<li>tBodyAcc-std()-Z</li>
<li>tGravityAcc-mean()-X</li>
<li>tGravityAcc-mean()-Y</li>
<li>tGravityAcc-mean()-Z</li>
<li>tGravityAcc-std()-X</li>
<li>tGravityAcc-std()-Y</li>
<li>tGravityAcc-std()-Z</li>
<li>tBodyAccJerk-mean()-X</li>
<li>tBodyAccJerk-mean()-Y</li>
<li>tBodyAccJerk-mean()-Z</li>
<li>tBodyAccJerk-std()-X</li>
<li>tBodyAccJerk-std()-Y</li>
<li>tBodyAccJerk-std()-Z</li>
<li>tBodyGyro-mean()-X</li>
<li>tBodyGyro-mean()-Y</li>
<li>tBodyGyro-mean()-Z</li>
<li>tBodyGyro-std()-X</li>
<li>tBodyGyro-std()-Y</li>
<li>tBodyGyro-std()-Z</li>
<li>tBodyGyroJerk-mean()-X</li>
<li>tBodyGyroJerk-mean()-Y</li>
<li>tBodyGyroJerk-mean()-Z</li>
<li>tBodyGyroJerk-std()-X</li>
<li>tBodyGyroJerk-std()-Y</li>
<li>tBodyGyroJerk-std()-Z</li>
<li>tBodyAccMag-mean()-</li>
<li>tBodyAccMag-std()-</li>
<li>tGravityAccMag-mean()-</li>
<li>tGravityAccMag-std()-</li>
<li>tBodyAccJerkMag-mean()-</li>
<li>tBodyAccJerkMag-std()-</li>
<li>tBodyGyroMag-mean()-</li>
<li>tBodyGyroMag-std()-</li>
<li>tBodyGyroJerkMag-mean()-</li>
<li>tBodyGyroJerkMag-std()-</li>
<li>fBodyAcc-mean()-X</li>
<li>fBodyAcc-mean()-Y</li>
<li>fBodyAcc-mean()-Z</li>
<li>fBodyAcc-std()-X</li>
<li>fBodyAcc-std()-Y</li>
<li>fBodyAcc-std()-Z</li>
<li>fBodyAccJerk-mean()-X</li>
<li>fBodyAccJerk-mean()-Y</li>
<li>fBodyAccJerk-mean()-Z</li>
<li>fBodyAccJerk-std()-X</li>
<li>fBodyAccJerk-std()-Y</li>
<li>fBodyAccJerk-std()-Z</li>
<li>fBodyGyro-mean()-X</li>
<li>fBodyGyro-mean()-Y</li>
<li>fBodyGyro-mean()-Z</li>
<li>fBodyGyro-std()-X</li>
<li>fBodyGyro-std()-Y</li>
<li>fBodyGyro-std()-Z</li>
<li>fBodyAccMag-mean()-</li>
<li>fBodyAccMag-std()-</li>
<li>fBodyBodyAccJerkMag-mean()-</li>
<li>fBodyBodyAccJerkMag-std()-</li>
<li>fBodyBodyGyroMag-mean()-</li>
<li>fBodyBodyGyroMag-std()-</li>
<li>fBodyBodyGyroJerkMag-mean()-</li>
<li>fBodyBodyGyroJerkMag-std()-</li>
</ol>

##5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

We use the function aggregate, to perform a mean on each column, using as grouping columns both activity and subject, and ignoring the column "type".

The new dataset contains only 180 observations of 68 variables.

Apart from activity and subject, all the other variables are means of the related feature for the specific combination of activity and subject.


##6. Save your data set as a txt file created with write.table() using row.name=FALSE 

We save the dataset into a file ("cleandataset.txt") as required.


