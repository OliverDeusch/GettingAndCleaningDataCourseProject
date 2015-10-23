This repository contains all elements required in order to solve the Coursera 
course project for "Getting and Cleaning Data".

The files in this repo:
- run_analysis.R	The R code.
- CodeBook.txt		Contains a description of the R code, the input and output data and the variables.
- features_info.txt	The detailed description of the variables supplied with the original data.
- README.md			This readme file.


The data in brief:
The data used in this project are measurements of mobile phones accelerometers. Data were generated
by 30 subjects performing 6 activities. The data itself are measurements and various transformations
and calculations thereof in three dimensional space (X, Y, Z). The variables are described in detail
in features_info.txt. The data were also separated into a training and a test set.


The operations performed by the R script run_analysis.R in brief:
- Read data into R, there are 8 files to read (listed above) all of which are supplied as part of the course.
- Assign labels (variable names) to data.
- Merge training and test data set
- Extract variables (columns) containing "std" or "mean" (ignoring case): 86 columns
- Convert activity codes to descriptive activity names and add to data
- Add subject information to data, now 88 columns
- Group data by activity and subject
- Summarize data by calculating means for all 86 variables that were extracted from the original data


