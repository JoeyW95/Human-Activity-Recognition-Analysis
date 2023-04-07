# Code Book

This code book describes the variables in the Human Activity Recognition dataset.

## Variables

* `subject`: An identifier of the subject who carried out the experiment (1-30)
* `activity`: The activity performed by the subject. It has six possible values:
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING

The following variables represent the mean and standard deviation measurements of various features. The variable names follow these conventions:

* Prefix `Time` or `Frequency` indicates whether the measurement is in the time domain or the frequency domain.
* `Body` or `Gravity` indicates whether the measurement is related to body motion or gravitational force.
* `Acceleration` or `Gyroscope` specifies the type of sensor used for the measurement.
* `Jerk` indicates the measurement is derived from the rate of change of the acceleration or angular velocity.
* `Magnitude` represents the magnitude of the three-dimensional signal calculated using the Euclidean norm.
* `Mean` or `StdDev` indicates the mean or standard deviation of the measurement, respectively.
* `_X`, `_Y`, or `_Z` denotes the axis of the measurement.

Examples of variables:

* `Time_Body_Acceleration_Mean_X`
* `Time_Body_Acceleration_Mean_Y`
* `Time_Body_Acceleration_Mean_Z`
* `Time_Body_Acceleration_StdDev_X`
* `Time_Body_Acceleration_StdDev_Y`
* `Time_Body_Acceleration_StdDev_Z`
* `Time_Gravity_Acceleration_Mean_X`
* ...

For a complete list of variables, please refer to the run_analysis.R script and the original dataset documentation.

