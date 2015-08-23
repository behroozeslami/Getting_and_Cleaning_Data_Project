Data Structure
--------------

The data file `mean_sd_data.txt` is extracted from [Human Activity
Recognition Using Smartphones Data
Set](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/)
using the R script `run_analysis.R`. It contains a tab-separated data
which specifies the mean and the standard deviation of 33 measured
variables, averaged over time, for 30 subjects and 6 different
activities. The measured variables are listed below:

-   tBodyAcc-XYZ
-   tGravityAcc-XYZ
-   tBodyAccJerk-XYZ
-   tBodyGyro-XYZ
-   tBodyGyroJerk-XYZ
-   tBodyAccMag
-   tGravityAccMag
-   tBodyAccJerkMag
-   tBodyGyroMag
-   tBodyGyroJerkMag
-   fBodyAcc-XYZ
-   fBodyAccJerk-XYZ
-   fBodyGyro-XYZ
-   fBodyAccMag
-   fBodyAccJerkMag
-   fBodyGyroMag
-   fBodyGyroJerkMag

The data file has 180 rows and 68 columns. Each row corresponds to a
specific subject and a specific activity (30 subject, 6 activities). The
column names are listed below:

-   Column 1: **Subject\_ID**: integer numbers between 1 and 30 (an
    identifier of the subject who carried out the experiment).

-   Column 2: **activity**: strings. (Identifies the type of activity,
    e.g. "LAYING", "SITTING", "STANDING", "WALKING",
    "WALKING\_DOWNSTAIRS" and "WALKING\_UPSTAIRS").

-   Columns 3 - 36: *Variable\_name*-**mean()**-*Component*: numeric.
    The *Variable\_name* is any of the measured variables listed above.
    In the case of vector variables, *Component* can be "X", "Y" or "Z"
    (each column identifies the mean of the corresponding measured
    variable averaged over time).

-   Columns 37 - 38: *Variable\_name*-**std()**-*Component*: numeric.
    The *Variable\_name* is any of the measured variables listed above.
    In the case of vector variables, *Component* can be "X", "Y" or "Z"
    (each column identifies the standard deviation of the corresponding
    measured variable averaged over time).

Data Preparations
-----------------

The test and training data (`X_test.txt` and `X_train.txt`) were
combined into a single set, and the columns of the new data set were
labeled by feature names from `features.txt`. The columns which
correspond to the mean and standard deviation of the variables were
selected. Two new columns were added to the data set to label it by the
subject and activity IDs, using `y_test.txt`, `y_train.txt`,
`subject_test.txt` and `subject_train.txt`. The numeric activity IDs
were converted to activity names as given in `activity_labels.txt`. The
data was then grouped by Subject\_ID and activity, and the average of
the remaining 66 columns were calculated.
