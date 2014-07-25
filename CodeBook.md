Getting and Cleaning Data Project CodeBook
===================
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
*A full description is available at the site where the data was obtained: 
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

 Here are the data for the project: 
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 
 Download, unzip and save the data foler under my working directory folder. Change the folder name to "Project".

*The run_analysis.R script performs the following steps to clean the data:
Step1:
 Read X_train.txt, y_train.txt and subject_train.txt from the "Project/train" folder and store them in trainData, trainLabel and trainSubject variables respectively using read.table().
 Read X_test.txt, y_test.txt and subject_test.txt from the "Project/test" folder and store them in testData, testLabel and testsubject variables respectively using read.table().
 Combine testData to trainData to generate a joinData; combine testLabel to trainLabel to joinLabel; combine testSubject to trainSubject to generate joinSubject using rbind(). Name the joinSubject as subject using names().
Step2:
 Read the features.txt file from the "Project" folder and store them in a table called features. We only extract the measurements on the mean and standard deviation. 
 To complish this, we first find the mean and std names in the features to form an index called meanStdIndices. Then we extract the data from joinData using the index. We store the extracted data in meanStdData and replace the meanStdData second column with features's second column content and remove the () in that name using gsub().
Step3: 
 Read the activity_labels.txt file from the "Project"" folder and store the data in a table called activity.
 Clean the activity names in the second column of activity. We first make all names to lower cases. 
 Transform the values of joinLabel according to the activity data frame.
 Name the JoinLabel activity.
Step4:
 Combine the joinSubject, joinLabel and meanStdData by column to get a new data frame, cleanedData.
Step5:
 Calculate the average of each variable for each activity and each subject.
Step6:
 Generate tidyData_with_means.txt with write.table() and automatically save the table under my working directory.This txt file contains the average of each variable for each activity and each subject. To calculate the average of each variable for each activity and each subject, we use two for loops, one for looping each subject and one for looping each activity to extract the data and calculte the means using colMeans(). 
 
Test:
Read the tidy data to table called data. Look at the first 4 columns and first 4 row of the table data.
It should give you a result like:
> data[1:4,1:4]
  subject          activity tBodyAcc.mean.X tBodyAcc.mean.Y
1       1           walking       0.2773308    -0.017383819
2       1   walkingupstairs       0.2554617    -0.023953149
3       1 walkingdownstairs       0.2891883    -0.009918505
4       1           sitting       0.2612376    -0.001308288
