#script for performing the analysis

#Downloading and unzipping the data
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filePath <- "./C03/Project/src/data.zip"
download.file(fileURL, destfile = filePath ,method = "curl")
unzip(zipfile = filePath, exdir = "./C03/Project/src" )

#Loading the data
directory <- "./C03/Project/src/UCI HAR Dataset/"
features <- read.table(file = paste0(directory,"features.txt"), col.names = c("id","feature"))
activities <- read.table(file = paste0(directory,"activity_labels.txt"), col.names = c("class", "activity"))
subject_train <- read.table(file = paste0(directory,"train/subject_train.txt"), col.names = "subject")
X_train <- read.table(file = paste0(directory,"train/X_train.txt"), col.names = features$feature)
Y_train <- read.table(file = paste0(directory,"train/y_train.txt"), col.names = "class")
subject_test <- read.table(file = paste0(directory,"test/subject_test.txt"), col.names = "subject")
X_test <- read.table(file = paste0(directory,"test/X_test.txt"), col.names = features$feature)
Y_test <- read.table(file = paste0(directory,"test/y_test.txt"), col.names = "class")

#Merging all the data to create one data set
X <- rbind(X_train, X_test)
Y <- rbind(Y_train, Y_test)
Subject <- rbind(subject_train, subject_test)
complete_data <- cbind(Subject, Y, X)

#Extracting only the measurements on the mean and standard deviation
library(dplyr)
tidy_data <- complete_data %>% select(subject, class, contains(".mean."), contains(".std."))

#Using descriptive activity names
tidy_data$class <- activities[tidy_data$class, "activity"]

#Labeling the data set with descriptive variable names
names(tidy_data)[2] <- "activity"
names(tidy_data) <- gsub("^t", "time", names(tidy_data))
names(tidy_data) <- gsub("^f", "frequency", names(tidy_data))
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("\\.mean\\.", "MeanValue", names(tidy_data))
names(tidy_data) <- gsub("\\.std\\.", "StandardDeviation", names(tidy_data))
names(tidy_data) <- gsub("\\.\\.(.)", "(\\1)", names(tidy_data))
names(tidy_data) <- gsub("\\.$", "", names(tidy_data))

#Creating a second, independent tidy data set with the average of each variable 
#for each activity and each subject
final_data <-   tidy_data %>%
                group_by(subject, activity) %>%
                summarise_all(funs(mean))

#Writing the data to a file
write.table(final_data, "./C03/Project/src/tidy_data.txt", row.name=FALSE)