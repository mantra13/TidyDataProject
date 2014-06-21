Human Activity Recognition Using Smartphones Processed Dataset 
===============================================================

## Background

The raw data source is the **Human Activity Recognition Using Smartphones Version 1.0**. These data were collected through experiments which have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

#### For each record, following is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### The raw dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about raw dataset contact: activityrecognition@smartlab.ws

### Data Citation

Use of the raw dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Raw Dataset URL : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Processing

The raw dataset has been processed to produce a tidy dataset which can be used for later analysis. The processing is done by R script 'run_analysis.R'. The script is responsible for the following:

* Combines the subject & activity to the corresponding 'train' & 'test' data.

* Combines the 'train' & 'test' data to create one dataset.

* Extracts only the 'mean' and 'std' measurements for each activity.

* Changes the measurement names to appropriately describe the measurements.

* Applies the activity labels to each activity code.

* Calculates the averages of each measurement, by each activity , for each subject.

* Creates a text file, named 'UCI_HAR_ProcData.txt', of the processed dataset.

**README.md** gives a detail description of the run_analysis() function.
 
### Variable List

The processed dataset consist of 68 variables. Each row of the dataset denotes the averages of each measurement for particular activity performed by a subject.

#### Abbreviations used in variable names
* Acc -  signal data collected by Accelerometer.

* Gyro - signal data collected by Gyroscope.

* XYZ - 3 axial signal data in X , Y & Z directions.

* prefix t -  time domain signals captured at a constant rate of 50 Hz.

* Jerk - signal obtained by the body linear acceleration and angular velocity derived in time.

* Mag - magnitude of these three-dimensional signals, calculated using Euclidean norm.

* prefix f - signals with a Fast Fourier Transform (FFT) application.

#### Variable Descriptions

- **Subject** - Identity of the subject. Its range is from 1 to 30.  
**Data type** :  Numeric 
    
- **Activity** - Descriptive activity name.   
**Levels** : 'WALKING', 'WALKING UPSTAIRS', 'WALKING DOWNSTAIRS', ' SITTING', 'STANDING', 'LAYING'  
**Data type** : Categorical

- **tBodyAccMeanX** - Average body acceleration measured by accelerometer on X axis.  
**Data type** :  Numeric 
    
- **tBodyAccMeanY** - Average body acceleration measured by accelerometer on Y axis.  
**Data type** :  Numeric 
      
- **tBodyAccMeanZ** - Average body acceleration measured by accelerometer on Z axis.  
**Data type** :  Numeric 
         
- **tGravityAccMeanX** - Average gravity acceleration measured by accelerometer on X axis.  
**Data type** :  Numeric 
      
- **tGravityAccMeanY** - Average gravity acceleration measured by accelerometer on Y axis.  
**Data type** :  Numeric 
      
- **tGravityAccMeanZ** - Average gravity acceleration measured by accelerometer on Z axis.  
**Data type** :  Numeric 
       
- **tBodyAccJerkMeanX** - Average body jerk measured by accelerometer on X axis.   
**Data type** :  Numeric 
      
- **tBodyAccJerkMeanY** - Average body jerk measured by accelerometer on Y axis.  
**Data type** :  Numeric 
       
- **tBodyAccJerkMeanZ** - Average body jerk measured by accelerometer on Z axis.  
**Data type** :  Numeric 
       
- **tBodyGyroMeanX** - Average body acceleration measured by gyroscope on X axis.   
**Data type** :  Numeric 
      
- **tBodyGyroMeanY** - Average body acceleration measured by gyroscope on Y axis.  
**Data type** :  Numeric 
       
- **tBodyGyroMeanZ** - Average body acceleration measured by gyroscope on Z axis.  
**Data type** :  Numeric 
       
- **tBodyGyroJerkMeanX** - Average body jerk measured by gyroscope on X axis.  
**Data type** :  Numeric 
          
- **tBodyGyroJerkMeanY** - Average body jerk measured by gyroscope on Y axis.  
**Data type** :  Numeric 
          
- **tBodyGyroJerkMeanZ** - Average body jerk measured by gyroscope on Z axis.  
**Data type** :  Numeric 
          
- **tBodyAccMagMean** - Average body acceleration magnitude measured by accelerometer.   
**Data type** :  Numeric 
           
- **tGravityAccMagMean** - Average gravity acceleration magnitude measured by accelerometer.  
**Data type** :  Numeric 
              
- **tBodyAccJerkMagMean** - Average body acceleration jerk magnitude measured by accelerometer.  
**Data type** :  Numeric 
              
- **tBodyGyroMagMean** - Average body acceleration magnitude measured by gyroscope.  
**Data type** :  Numeric 
             
- **tBodyGyroJerkMagMean** - Average body acceleration jerk magnitude measured by gyroscope.  
**Data type** :  Numeric 
             
- **fBodyAccMeanX** - Average body acceleration measured by accelerometer on X axis with FFT application.  
**Data type** :  Numeric 
      
- **fBodyAccMeanY** - Average body acceleration measured by accelerometer on Y axis with FFT application.  
**Data type** :  Numeric 
       
- **fBodyAccMeanZ** - Average body acceleration measured by accelerometer on Z axis with FFT application.  
**Data type** :  Numeric 
      
- **fBodyAccJerkMeanX** - Average body jerk measured by accelerometer on X axis with FFT application.  
**Data type** :  Numeric 
      
- **fBodyAccJerkMeanY** -  Average body jerk measured by accelerometer on Y axis with FFT application.  
**Data type** :  Numeric 
      
- **fBodyAccJerkMeanZ** - Average body jerk measured by accelerometer on Z axis with FFT application.  
**Data type** :  Numeric 
      
- **fBodyGyroMeanX** - Average body acceleration measured by gyroscope on X axis with FFT application.  
**Data type** :  Numeric 
      
- **fBodyGyroMeanY** - Average body acceleration measured by gyroscope on Y axis with FFT application.  
**Data type** :  Numeric 
     
- **fBodyGyroMeanZ** - Average body acceleration measured by gyroscope on Z axis with FFT application.  
**Data type** :  Numeric 
      
- **fBodyAccMagMean** - Average body acceleration magnitude with FFT application.   
**Data type** :  Numeric 
 
- **fBodyAccJerkMagMean** - Average body jerk magnitude measured by accelerometer with FFT application.   
**Data type** :  Numeric 

- **fBodyGyroMagMean** - Average body acceleration magnitude measured by gyroscope with FFT application.   
**Data type** :  Numeric 
        
- **fBodyGyroJerkMagMean** - Average body jerk magnitude measured by gyroscope with FFT application.   
**Data type** :  Numeric 
          
- **tBodyAccStdX** - Standard deviation of body acceleration measured by accelerometer on X axis.  
**Data type** :  Numeric 
          
- **tBodyAccStdY** - Standard deviation of body acceleration measured by accelerometer on Y axis.  
**Data type** :  Numeric 
           
- **tBodyAccStdZ** - Standard deviation of body acceleration measured by accelerometer on Z axis.  
**Data type** :  Numeric 
           
- **tGravityAccStdX** - Standard deviation of gravity acceleration measured by accelerometer on X axis.  
**Data type** :  Numeric 
           
- **tGravityAccStdY** - Standard deviation of body acceleration measured by accelerometer on Y axis.  
**Data type** :  Numeric 
           
- **tGravityAccStdZ** - Standard deviation of body acceleration measured by accelerometer on Z axis.  
**Data type** :  Numeric 
           
- **tBodyAccJerkStdX** - Standard deviation of body jerk measured by accelerometer on X axis.  
**Data type** :  Numeric 
          
- **tBodyAccJerkStdY** - Standard deviation of body acceleration measured by accelerometer on Y axis.  
**Data type** :  Numeric 
          
- **tBodyAccJerkStdZ** - Standard deviation of body acceleration measured by accelerometer on Z axis.  
**Data type** :  Numeric 
           
- **tBodyGyroStdX** - Standard deviation of body acceleration measured by gyroscope on X axis.  
**Data type** :  Numeric 
             
- **tBodyGyroStdY** - Standard deviation of body acceleration measured by gyroscope on Y axis.  
**Data type** :  Numeric 
               
- **tBodyGyroStdZ** - Standard deviation of body acceleration measured by gyroscope on Z axis.  
**Data type** :  Numeric 
               
- **tBodyGyroJerkStdX** - Standard deviation of body jerk measured by gyroscope on X axis.  
**Data type** :  Numeric 
               
- **tBodyGyroJerkStdY** - Standard deviation of body jerk measured by gyroscope on Y axis.  
**Data type** :  Numeric 
                 
- **tBodyGyroJerkStdZ** - Standard deviation of body jerk measured by gyroscope on Z axis.  
**Data type** :  Numeric 
                 
- **tBodyAccMagStd** - Standard deviation of body acceleration magnitude measured by accelerometer.  
**Data type** :  Numeric 
             
- **tGravityAccMagStd** - Standard deviation of gravity acceleration magnitude measured by accelerometer.  
**Data type** :  Numeric 
              
- **tBodyAccJerkMagStd** - Standard deviation of body jerk magnitude measured by accelerometer.  
**Data type** :  Numeric 
               
- **tBodyGyroMagStd** - Standard deviation of body acceleration magnitude measured by gyroscope.  
**Data type** :  Numeric 
               
- **tBodyGyroJerkMagStd** - Standard deviation of body jerk magnitude measured by gyroscope.  
**Data type** :  Numeric 
                 
- **fBodyAccStdX** - Standard deviation of body acceleration measured by accelerometer on X axis with FFT application.    
**Data type** :  Numeric 
              
- **fBodyAccStdY** - Standard deviation of body acceleration measured by accelerometer on Y axis with FFT application.    
**Data type** :  Numeric 
                
- **fBodyAccStdZ** - Standard deviation of body acceleration measured by accelerometer on Z axis with FFT application.    
**Data type** :  Numeric 
                
- **fBodyAccJerkStdX** - Standard deviation of body jerk measured by accelerometer on X axis with FFT application.    
**Data type** :  Numeric 
                
- **fBodyAccJerkStdY** - Standard deviation of body jerk measured by accelerometer on Y axis with FFT application.    
**Data type** :  Numeric 
                
- **fBodyAccJerkStdZ** - Standard deviation of body jerk measured by accelerometer on Z axis with FFT application.    
**Data type** :  Numeric 
                
- **fBodyGyroStdX** - Standard deviation of body acceleration measured by gyroscope on X axis with FFT application.    
**Data type** :  Numeric 
                  
- **fBodyGyroStdY** - Standard deviation of body acceleration measured by gyroscope on Y axis with FFT application.    
**Data type** :  Numeric 
                    
- **fBodyGyroStdZ** - Standard deviation of body acceleration measured by gyroscope on Z axis with FFT application.    
**Data type** :  Numeric 
                    
- **fBodyAccMagStd** - Standard deviation of body acceleration magnitude measured by accelerometer with FFT application.    
**Data type** :  Numeric 
                
- **fBodyAccJerkMagStd** - Standard deviation of body jerk magnitude measured by accelerometer with FFT application.    
**Data type** :  Numeric 
                
- **fBodyGyroMagStd** - Standard deviation of body acceleration magnitude measured by gyroscope with FFT application.    
**Data type** :  Numeric 
                 
- **fBodyGyroJerkMagStd** - Standard deviation of body jerk magnitude measured by gyroscope with FFT application.    
**Data type** :  Numeric 
                