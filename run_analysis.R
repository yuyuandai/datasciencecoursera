#setwd("P:/datasciencecoursera")
#Step1
trainData <- read.table("Project/train/X_train.txt")
testData <- read.table("Project/test/X_test.txt")
joinData <- rbind(trainData, testData)

trainSubject <- read.table("Project/train/subject_train.txt")
testSubject <- read.table("Project/test/subject_test.txt")
joinSubject <- rbind(trainSubject, testSubject)
names(joinSubject) <- "subject"

trainLabel <- read.table("Project/train/y_train.txt")
testLabel <- read.table("Project/test/y_test.txt") 
joinLabel <- rbind(trainLabel, testLabel)

#Step2
features <- read.table("Project/features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
meanStdData <- joinData[, meanStdIndices]
names(meanStdData) <- gsub("\\(\\)", "", features[meanStdIndices, 2])

#Step3
activity <- read.table("Project/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity"

#Step4
cleanedData <- cbind(joinSubject, joinLabel, meanStdData)

#Step5
subjectLen <- length(table(joinSubject)) 
activityLen <- dim(activity)[1] 
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
        for(j in 1:activityLen) {
                result[row, 1] <- sort(unique(joinSubject)[, 1])[i]
                result[row, 2] <- activity[j, 2]
                iSubject <- i == cleanedData$subject
                jActivity <- activity[j, 2] == cleanedData$activity
                result[row, 3:columnLen] <- colMeans(cleanedData[iSubject&jActivity, 3:columnLen])
                row <- row + 1
        }
}

#Step6
write.table(result, "tidyData_with_means.txt") 

#Test
data <- read.table("./tidyData_with_means.txt")
data[1:4, 1:4]
