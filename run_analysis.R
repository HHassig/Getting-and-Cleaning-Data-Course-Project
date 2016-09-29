# Make sure correct libraries are present
library(data.table)
library(dplyr)

# Set path to current working directory so we can begin to manipulate our files
path <- getwd()

# Download and unzip dataset
url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
f <- 'Dataset.zip'
if(!file.exists(f)) {
  download.file(url,f)
}
d <- 'UCI HAR Dataset'
if(!file.exists(d)) {
  unzip(f)
}

# Enter into "UCI HAR Dataset" as our working directory
setwd(d)

# Read and combine data sets, "x"
testData <- read.table("test/X_test.txt")
trainData <- read.table("train/X_train.txt")
X <- rbind(testData, trainData)

# Keeping "tidy"
rm(testData)
rm(trainData)

# Read and combine data sets, "subject"
testSubject <- read.table("test/subject_test.txt")
trainSubject <- read.table("train/subject_train.txt")
S <- rbind(testSubject, trainSubject)

# Keeping "tidy"
rm(testSubject)
rm(trainSubject)

# Read and combine data sets, "y"
testLabel <- read.table("test/y_test.txt")
trainLabel <- read.table("train/y_train.txt")
Y <- rbind(testLabel, trainLabel)

# Keeping "tidy"
rm(testLabel)
rm(trainLabel)

# Read features list so we have column names for our data
featuresList <- read.table("features.txt", stringsAsFactors=FALSE)

# Only names from features list
features <- featuresList$V2

# Organize to only keep mean and std columns
columnsKeep <- grepl("(std|mean[^F])", features, perl=TRUE)

# Keep only the data we desire, change names to something more understandable
X <- X[, columnsKeep]
names(X) <- features[columnsKeep]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# Read activity list so that we can add descriptive names to our dataset
activities <- read.table("activity_labels.txt")
activities[,2] = gsub("_", "", tolower(as.character(activities[,2])))
Y[,1] = activities[Y[ ,1], 2]

# Add an activity label
names(Y) <- "activity"

# Add understandable labels to the names
names(S) <- "subject"
tidyData <- cbind(S, Y, X)
write.table(tidyData, "tidyData1.txt")

# Create second "tidy" data set with avg of each var for each act and each sub
uS = unique(S)[, 1]
nS = length(uS)
nA = length(activities[, 1])
nC = length(names(tidyData))
td = tidyData[1:(nS*nA), ]

row = 1
for (a in 1:nS) {
  for (b in 1:nA) {
    td[row, 1] = uS[a]
    td[row, 2] = activities[b, 2]
    tmp <- tidyData[tidyData$subject == a & tidyData$activity == activities[b, 2], ]
    td[row, 3:nC] <- colMeans(tmp[, 3:nC])
    row = row + 1
  }
}

# Create text file with means
write.table(td, "tidyDataMean.txt")