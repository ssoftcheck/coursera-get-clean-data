run_analysis.R will make a tidy data set from the UCI HAR dataset of human activity measurements from a smartphone accelerometer and gyroscope.
It requires the train and test folders of this zip file http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip to be in the working directory.

# The follwing is a paraphrased verion of the original data's readme
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz.
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals.
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm ('magnitude' variables). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals, denoted by the prefix 'freq.'. 

These signals were used to estimate variables of the feature vector for each pattern
'.XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are:

## mean(): Mean value
## std(): Standard deviation
## mad(): Median absolute deviation 
## max(): Largest value in array
## min(): Smallest value in array
## sma(): Signal magnitude area
## energy(): Energy measure. Sum of the squares divided by the number of values. 
## iqr(): Interquartile range 
## entropy(): Signal entropy
## arCoeff(): Autorregresion coefficients with Burg order equal to 4
## correlation(): correlation coefficient between two signals
## maxInds(): index of the frequency component with largest magnitude
## meanFreq(): Weighted average of the frequency components to obtain a mean frequency
## skewness(): skewness of the frequency domain signal 
## kurtosis(): kurtosis of the frequency domain signal 
## bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
## angle(): Angle between to vectors.

However, this data retains only the mean and standard deviation estimates.