library(dplyr)
library(reshape2)

############ Step 0: Access and download data ##################################

#file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(file_url, destfile = "getdata-projectfiles-UCI HAR Dataset.zip")
#unzip("getdata-projectfiles-UCI HAR Dataset.zip")

############ Step 1: Merge data sets ###########################################
features <- read.table("./UCI HAR Dataset/features.txt", colClasses = "character")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                              col.names= c("activity_id", "activity"))

# merge training set
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                            col.names = c("subject"))
train_X <- read.table("./UCI HAR Dataset/train/X_train.txt", 
                      col.names = features[,2])
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                      col.names = c("activity_id"))
train <- cbind(subject_train, train_X, train_y)

# merge test set
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                            col.names = c("subject"))
test_X <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features[,2])
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c("activity_id"))
test <- cbind(subject_test, test_X, test_y)

data_set <- rbind(train, test) # this is my consolidated data set

data_set <- merge(data_set,  # included activity levels
                   activity_labels, 
                   by.x="activity_id", 
                   by.y="activity_id") 

############ Step 2: Extract mean and std. of the measurements #################
data_set <- select(data_set, c(grep("subject", names(data_set)),
                               grep("activity", names(data_set)),
                               grep("mean", names(data_set)),
                                 grep("std", names(data_set))))


############ Step 3: Melt and recast the data ##################################
names <- names(data_set)
melted_data <- melt(data_set, id=c("subject", "activity"), 
                    measure.vars=names[!(names %in% c("subject", "activity",
                                                      "activity_id"))])
casted_data <- dcast(melted_data, subject+activity ~ variable, mean)


############ Step 4: Export data ###############################################
write.table(casted_data, file="tidyDataset.txt", row.name=FALSE)
