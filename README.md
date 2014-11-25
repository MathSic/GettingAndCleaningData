## Overview

The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Script

The script first loads the testing data set and then the training one. It merges all the info into one data frame. Then the name of the columns are changed to be more clear. Afer that, only the columns that contain the wrds "main()" and "std()" are selected. Next the numbers for the ativities are mapped to the appropriate name. finally a idy data frame is created using melt and ddply.
