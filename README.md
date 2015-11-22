# dataCleaning
This repo contains my project for the Coursera data cleaning course. 

## Overview
The course project consists of creating a script that takes the Samsung accelerometer data 
and preprocesses them in order to come up with a tidy dataset for further analyses.

### Input
I also included the code to download the data directly from the website and unzip it within R. However,
due to resource requirements, I uncommented these lines and start with the unzipped data directory in 
the workspace. 

### Preprocessing
The actual data preprocessing is executed by the run_analysis.R script. It takes the unzipped data, processes
it and writes the output to the tidyDataset.txt file.

### Output
The tidyDataset.txt file contains a tidy dataset, with one row per subject and activity and one column per
measurement variable.
