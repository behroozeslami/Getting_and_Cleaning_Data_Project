The R script `run_analysis.R` processes the [Human Activity Recognition
Using Smartphones Data
Set](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/) to
generate the data file `mean_sd_data.txt`. The code works as follows:

1.  The file `features.txt` is read into a dataframe to extract the
    column names for the training and test data. As there are duplicate
    names in `features.txt`, `make.unique()` function is used to make
    unique column names, which are stored in a character vector
    `Column_names`

2.  The test and training data (`X_test.txt` and `X_train.txt`) are read
    into R dataframes, their columns are labeled by `Column_names`, and
    then combined into a single data frame `full_data`

3.  The columns of `full_data` which contain the keywords *mean()* or
    *std()* are selected to generate a new data frame `selected_data`

4.  numeric activity labels for the training and test data
    (`y_test.txt`, `y_train.txt`) are read and combined to yield
    `numeric_activiy_labels`, which is then transformed into descriptive
    activity labels and added to `selected_data` as a new column to form
    a new dataframe `act_labeled_data`.

5.  subject IDs for the training and test data (`subject_test.txt`,
    `subject_train.txt`) are read and combined to yield
    `subject_labels`, which is then added to `act_labeled_data` as a new
    column to form a new dataframe `labeled_data`.

6.  The dataframe `labeled_data` is grouped by `subject_ID` and
    `activity` to yield `group_data`.

7.  `group_data` is averaged to generate `mean_sd_data`.

8.  `mean_sd_data` is saved into `mean_sd_data.txt`.
