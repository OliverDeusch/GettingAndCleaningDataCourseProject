##

# Load data: training and test data, labels for variables, activity labels, activity label code, test subject
#
train <- read.table("UCI HAR Dataset/train/X_train.txt") # Training data set
test <- read.table("UCI HAR Dataset/test/X_test.txt") # Test data set

features <- read.table("UCI HAR Dataset/features.txt") # Variables

row_labels_train <- read.table("UCI HAR Dataset/train/y_train.txt") # Training data set activities
row_labels_test <- read.table("UCI HAR Dataset/test/y_test.txt") # Test data set activities
activity_code <- read.table("UCI HAR Dataset/activity_labels.txt") # Translations to descriptive activities 

subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt") # Training data set subjects 
subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt") # Test data set subjects


# Assign variable names to data
names(train) <- features[, 2]
names(test) <- features[, 2]

# Merge the training and the test sets
combined <- rbind(train,test)

# Extract only the measurements on the mean and standard deviation for each measurement.
v <- c(grep("mean", features[, 2], ignore.case = TRUE), grep("std", features[, 2]))
extracted <- combined[, v]

# Convert activity codes into descriptive activity names
row_labels_combined <- c(row_labels_train[, 1], row_labels_test[, 1])
row_labels_combined <- gsub(1, "WALKING", row_labels_combined)
row_labels_combined <- gsub(2, "WALKING_UPSTAIRS", row_labels_combined)
row_labels_combined <- gsub(3, "WALKING_DOWNSTAIRS", row_labels_combined)
row_labels_combined <- gsub(4, "SITTING", row_labels_combined)
row_labels_combined <- gsub(5, "STANDING", row_labels_combined)
row_labels_combined <- gsub(6, "LAYING", row_labels_combined)

#for (i in 1:length(unique(row_labels_combined))) {
#  test <- unique(row_labels_combined)[i]
#  row_labels_combined[row_labels_combined == test] <- as.character(activity_code$V2[activity_code$V1 == test])
#}
#rm(i, test)

# Add the descriptive activity names to extracted data frame
library(dplyr)
extracted <- mutate(extracted, Activity = row_labels_combined)

# Add subject information
subjects_combined <- c(subjects_train[, 1], subjects_test[, 1])
extracted <- mutate(extracted, Subject = subjects_combined)

# Group by Activity and Subject
grouped <- group_by(extracted, Activity, Subject)

# Summarize grouped data
grouped_avg <- summarize_each(grouped, funs(mean))
