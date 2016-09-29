## Course Project

### Overview

The purpose of this project is to demonstrate your ability to collect, work
with, and clean a data set. The goal is to prepare tidy data that can be used
for later analysis. You will be graded by your peers on a series of yes/no
questions related to the project. You will be required to submit: 1) a tidy
data set as described below, 2) a link to a Github repository with your script
for performing the analysis, and 3) a code book that describes the variables,
the data, and any transformations or work that you performed to clean up the
data called `CodeBook.md`. You should also include a `README.md` in the repo
with your scripts. This repo explains how all of the scripts work and how they
are connected.

One of the most exciting areas in all of data science right now is wearable
computing - see for example this article . Companies like Fitbit, Nike, and
Jawbone Up are racing to develop the most advanced algorithms to attract new
users. The data linked to from the course website represent data collected from
the accelerometers from the Samsung Galaxy S smartphone. A full description is
available at the site where the data was obtained:

	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called `run_analysis.R` that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each
   measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each
   variable for each activity and each subject.


### Personal Checklist

#### Tidy Data Set

_From Prompt:_ Please upload a tidy data set according to the instructions
in the project description. Please upload your data set as a separate file (do
not cut and paste a dataset directly into the text box, as this may cause
errors saving your submission)

#### Second Data Set

_From Prompt:_ Creates a second, independent tidy data set with the average
of each variable for each activity and each subject

#### Github Repo with Required Scripts

_From Prompt:_ Please submit a link to a Github repo with the code for
performing your analysis. The code should have a file `run_analysis.R` in the
main directory that can be run as long as the Samsung data is in your working
directory.  The output should be the tidy data set you submitted for part 1

#### Code Book

_From Prompt:_ A code book that describes the variables, the data, and any
transformations or work that you performed to clean up the data called
`CodeBook.md`

#### README

_From Prompt:_ You should also include a `README.md` in the repo with your
scripts. This repo explains how all of the scripts work and how they are
connected

_From Prompt:_ You should include a `README.md` in the repo describing how
the script works

### Data Analysis Explanation

#### 1st tiny data set, `tidyData1.txt`:

- Read and combine data sets
- Read and combine subjects
- Read and combine data labels
- Read features list
- Create subset of only std and mean features from list
- Create same subset on data set
- Rename features to be more understandable
- Read activity list
- Rename activities to be more understandable
- Rename data labels with activity name
- Merge data, subjects, and labels to single tiny data set
- Write tiny data set to file, `tidyData1.txt`

#### 2nd tiny data set, `tidyDataMean.txt`

- Prepare empty data set of appropriate length
- Loop through subjects, followed by a subloop through activities
- For each activity in a subject, get the full list of measurements
- Obtain the mean of each of these activities
- Put the means in subsequent columns of the subject/activity row
- Write second tiny data set to file, `tidyDataMean.txt`