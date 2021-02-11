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

## The final data
Each row represents the average of each variable for each activity and each subject.
The variables in this data come from the accelerometer and gyroscope 3-axial raw signals timeAccelerometer-XYZ and timeGyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccelerometer-XYZ and timeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerometerJerk-XYZ and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerometerMagnitude, timeGravityAccelerometerMagnitude, timeBodyAccelerometerJerkMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopescopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAccelerometer-XYZ, frequencyBodyAccelerometerJerk-XYZ, frequencyBodyGyroscope-XYZ, frequencyBodyAccelerometerJerkMagnitude, frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkMagnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

timeBodyAccelerometer-XYZ
timeGravityAccelerometer-XYZ
timeBodyAccelerometerJerk-XYZ
timeBodyGyroscope-XYZ
timeBodyGyroscopeJerk-XYZ
timeBodyAccelerometerMagnitude
timeGravityAccelerometerMagnitude
timeBodyAccelerometerJerkMagnitude
timeBodyGyroscopeMagnitude
timeBodyGyroscopeJerkMagnitude
frequencyBodyAccelerometer-XYZ
frequencyBodyAccelerometerJerk-XYZ
frequencyBodyGyroscope-XYZ
frequencyBodyAccelerometerMagnitude
frequencyBodyAccelerometerJerkMagnitude
frequencyBodyGyroscopeMagnitude
frequencyBodyGyroscopeJerkMagnitude

The set of variables that were estimated from these signals are: 

Mean value
Standard deviation
