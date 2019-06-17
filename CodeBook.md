# Code book for Getting and Cleaning Data course project

This code book is for the data set located in the tidy_Activity.txt file of this repository.

See the README.md file of this repository for background information on this data set.

# Data
The data file is a text file, with the first row containing the variable names
There were 30 volunteers and 6 activities

# Variables
After the first row, each row contains 79 signal measurements for a given subject and activity

 - Subject: integer (1 to 30)
 - Activity: string with 6 possible values:
    WALKING: subject was walking
    WALKING_UPSTAIRS: subject was walking upstairs
    WALKING_DOWNSTAIRS: subject was walking downstairs
    SITTING: subject was sitting
    STANDING: subject was standing
    LAYING: subject was laying

# Transformations 
The zip file containing the source data is located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The following transformations were applied to the source data:
  The training and test sets were merged to create one data set.
  The measurements on the mean and standard deviation (i.e. signals containing the strings mean and std were extracted for each measurement, and the others were discarded.
  The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names.
  The variable names were replaced with descriptive variable names using the following set of rules: 
    Special characters (i.e. (, ), and -) were removed
    The initials 'f' and 't' were expanded to frequencyDomain and timeDomain respectively.
    Acc, Gyro, Mag, Freq, stddev and std were replaced with Accelerometer, Gyroscope, Magnitude, Frequency, and StandardDeviation respectively.
    Replaced BodyBody with Body.

# Average of measurements 
  All measurements are floating-point values, normalised and bounded within [-1,1].
  Prior to normalisation, acceleration measurements (variables containing Accelerometer) were made in g's (9.81 m.s⁻²) and gyroscope measurements (variables containing Gyroscope) were made in radians per second (rad.s⁻¹).
  Magnitudes of three-dimensional signals (variables containing Magnitude) were calculated using the Euclidean norm.

The measurements are classified in two domains:
  Time-domain signals (variables prefixed by timeDomain), resulting from the capture of accelerometer and gyroscope raw signals.
  Frequency-domain signals (variables prefixed by frequencyDomain), resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.

Time-domain signals
  Average time-domain body acceleration in the X, Y and Z directions
  Standard deviation of the time-domain body acceleration in the X, Y and Z directions
  Average time-domain gravity acceleration in the X, Y and Z directions
  Standard deviation of the time-domain gravity acceleration in the X, Y and Z directions
  Average time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions
  Standard deviation of the time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions
  Average time-domain body angular velocity in the X, Y and Z directions
  Standard deviation of the time-domain body angular velocity in the X, Y and Z directions
  Average time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions
  Standard deviation of the time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions
  Average and standard deviation of the time-domain magnitude of body acceleration
  Average and standard deviation of the time-domain magnitude of gravity acceleration
  Average and standard deviation of the time-domain magnitude of body acceleration jerk (derivation of the acceleration in time)
  Average and standard deviation of the time-domain magnitude of body angular velocity
  Average and standard deviation of the time-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time)

Frequency-domain signals
  Average frequency-domain body acceleration in the X, Y and Z directions
  Standard deviation of the frequency-domain body acceleration in the X, Y and Z directions
  Weighted average of the frequency components of the frequency-domain body acceleration in the X, Y and Z directions
  Average frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions
  Standard deviation of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions
  Weighted average of the frequency components of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions
  Average frequency-domain body angular velocity in the X, Y and Z directions
  Standard deviation of the frequency-domain body angular velocity in the X, Y and Z directions
  Weighted average of the frequency components of the frequency-domain body angular velocity in the X, Y and Z directions
  Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body acceleration
  Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body acceleration jerk (derivation of the acceleration in time)
  Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body angular velocity
  Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time)
