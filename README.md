RUN_ANALYSIS
=============================
The purpose of the function **run_analysis()** is to tidy and process the UCI HAR raw dataset. This function creates a text file containing the processed dataset. This function is part of the R script **'run_analysis.R'**. **Codebook.md** file gives a detail description of the processed dataset.

REQUIREMENTS
-----------------------------

### RAW DATA SOURCE

The input dataset is a set of text files which are a part of the **Human Activity Recognition Using Smartphones Dataset Version 1.0**. These data were collected through experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Data were recorded using the embedded accelerometer & gyroscope in the smartphone. The data was then randomly partitioned into 2 sets where 70% of the volunteers was selected for generating the training data and 30% the test data. 

#### Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For each record
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

For more information about this dataset contact: activityrecognition@smartlab.ws

#### License

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


#### DATASET FILES

The following files should be located under the folder **'UCI HAR Dataset'** in the working directory.

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. 

- 'train/subject_train.txt': Subject identifiers. 

- 'train/Inertial Signals/total_acc_x_train.txt': 

- 'train/Inertial Signals/body_acc_x_train.txt': 

- 'train/Inertial Signals/body_gyro_x_train.txt': 

Dataset URL : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

FUNCTIONALITY
-----------------------------

The **run_analysis()** function performs the following:

- **Reads the Features Data**  
 Reads the data from Features.txt. This data is used to assign the variable names of the tidy data.   
 Modifies the features data to remove special characters ( eg: '-', '(', ')' ), changes 'mean' to 'Mean',   
 changes 'std' to 'Std' and changes 'BodyBody' to 'Body' to ensure better readability.
 Features dataset has 561 rows & 3 columns.
 
- **Reads Trian/Test data , Activity & Subject Data**  
 Reads the Train / Test data and their corresponding Subject and Activity data.  
 Assign the modified Features data to Train/Test dataset column names. 
 Dimensions : Train dataset has 7352 rows & 561 columns. Test data has 2947 rows & 561 columns.
 
- **Combines Train/Test Subject & Activity data**  
 The Train Subject data (subject_train.txt) and Train Activity data (y_train.txt) are combined. Same is done for the Test data.
 
- **Extract Relevant Columns from  Train/Test data**   
 Only column names meeting the following criteria are extracted from Train/Test data.
 - Columns having 'Mean' or 'Std' : Only the mean & standard deviation measurements are used in this processing.
 - Leave Columns with 'MeanFreq' 
 - Leave Columns with 'angle'   
 
 The extraction leaves only 66 variables in each Train & Test dataset.

- **Combines Train/Test to Subject & Activity data**  
 The Train/Test data is now combined to its corresponding Subject & Activity dataset. Then the Train data is combined to Test data.
 The dataset has 10299 rows & 68 columns.
 
- **Calculate Means of each Measurement by Subject & Activity**   
 The Train & Test combined data is now processed to calculate average across each variable for each activity by each subject. This dataset will have 180 rows & 68 columns.
 
- **Assign descriptive activity labels to dataset**  
 Reads the activity labels data(activity_labels.txt). Assigns the labels to the processed dataset.   
 
- **Writes dataset to text file**   
 The processed dataset is written into a text file located in the working directory. All the column names are also written into the file to ensure further use. The text file can be used in other R scripts using read.table() function. This test file can also be read using MS Excel by changing its file extension to '.csv'. 
 
OUTPUT
----------------------------- 

The output of the run_analysis() function is the text file name **'UCI_HAR_ProcData.txt'**. This file is located in the working directory.
