## Code Book for Course Project

### Course Proejct for Getting and Cleaning Data, part of the Data Specialization track at Coursera, Johns Hopkins University

### Overview

[Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) of the original data:

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

[Full Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) at the site where the data was obtained:

	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	
### Process

`run_analysis.R` performs the following to clean the data and create tiny data sets:

1. Merge the test and training sets into one data set

2. Read `features.txt` and use strictly the measurements of the mean and standard deviation for each measurement

3. Read `activity_labels.txt` and change to understandable activity names in order to name the activities in the data set

4. Label the data set with descriptive names -- converted into lowercase with underscores and brackets omitted

5. Merge the features with activity labels and subject IDs, saved as `tidyData1.txt`

6. The mean of each measurement for each activity and each subject is merged into a second data set and saved as `tidyDataMean.txt`

### Variables

- testData - table contents of `test/X_test.txt`
- trainData - table contents of `train/X_train.txt`
- testSubject - table contents of `test/subject_test.txt`
- trainSubject - table contents of `test/subject_train.txt`
- testLabel - table contents of `test/y_test.txt`
- trainLabel - table contents of `train/y_train.txt`
- X - Measurement data. Combined data set of the test and train data
- Y - Data Labels. Combined data set of the test and train label variables
- S - Subjects. Combined data set of the two subject variables
- featuresList - table contents of `features.txt`
- features - Names of for data columns derived from featuresList
- columnsKeep - logical vector of which features to use in tidy data set
- activities - table contents of `activity_labels.txt`, made understandable
- tidyData - subsetted, understandable data ready for output according to project description.
- uS - unique subjects from S
- nS - number of unique subjects
- nA - number of activities
- nC - number of columns in tidyData
- td - second tiny data set with average of each variable for each activity and subject

### Output

#### tidyData1.txt

`tidyData1.txt` is a 10299 x 68 data frame

- First column: Subject IDs
- Second column: Activity Names
- Third+ column: Measurements
- Subject IDs are integers between 1 and 30

#### tidyDataMean.txt

`tidyDataMean.txt` is a 180 x 68 data frame

- First column: Subject IDs
- Second column: Activity Names
- Third+ colum: Average for each attribute