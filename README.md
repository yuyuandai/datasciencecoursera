Getting and Cleaning Data Project README
===================

This file describes how run_analysis.R script works.

Step1:

Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip , unzip and save the data foler under my working directory folder. Change the folder name to "Project".

Step2:

Use source("run_analysis.R") command in RStudio.

Step3:

After running run_anslysis.R, it will generate one txt file called "tidyData_with_means" in your current working directory.

Test:

You can test if the code running properly. You can read "data_with_means.txt" to a data frame called "data". You can read certain column and row to see if you get correct result.

Make sure the folder "Project" and the run_analysis.R script are both in you current working directory.
