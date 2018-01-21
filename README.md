# Run_analysis

1) load the test and train txt files into the R console under variables with the respective names

2) combine the test and train files as their main file (subject, x, or y)

3) change column names to "subject" (subject) and activity ("y")

4) load the activity labels and features into R

5) substitute "()" for "" since they do not add value to the description

6) extract only the mean and standard deviation fields ("mean", "std")

7) combine subject, activity, and dataset

8) replace the numbers in the activity set with their respective proper name

9) group the data by subject and activity, display the mean

10) create a text file of tidy data


Variable names:
-subject_test, X_test, y_test, subject_train, X_train, y_train <- variables holding respective file names

-subject, X, y <- variables holding combined data

-activity label <- raw activity label file

-features <- data names from txt file

-mean_std_index <- column references that hold mean or standard deviation data

-dataset <- merged final data set with only the relevant columns

-activities <- numerical, not descriptive, reference, will be replaced with descriptive reference

-data_temp <- temporary melted file

-dataset_tidy <- the final table that is ordered by subject and activity
