# The code book

The script named run_analysis does the followings:

1. Downloads and unzips the data
2. Loads the input data resulting in the following data frames:

- features: List of all features
- activities: Links the class labels with their activity name
- subject_train, subject_test: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
- X_train, X_test: Training and test sets
- Y_train, Y_test: Training and test labels

3. Merges the training and the test sets to create one data frame named **complete_data**
4. Extracts only the measurements on the mean and standard deviation for each measurement and saves it to data frame named **tidy_data**
5. Uses descriptive activity names from loaded *activities* data to name the activities in the *tidy_data* 
6. Appropriately labels the *tidy_data* with descriptive variable names
7. Creates an independent tidy data set with the average of each variable for each activity and each subject into data frame named **final_data**
8. Writes the *final_data* into a file named **tidy_data.txt**
