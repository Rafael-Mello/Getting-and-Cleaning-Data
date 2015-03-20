# Please refer to the README file for details on what is the purpose of this script 

setwd("~/UCI HAR Dataset")
library("dplyr")
library("reshape2")

# READING 'features' file 
    # this is the "header" of the final data set, with descriptive variable names

features <- read.csv("features.txt", sep="", header=FALSE)

# READING 'activity labels' file
    # this is the description to the numeric labels

activityLabels <- read.csv("activity_labels.txt", sep="", header=FALSE)

# READING 'test' and 'train' sets
    # the "header" is applied to the sets using 'col.names'
    # smaller sets are created, extracting the 'means' and 'stds' variables
    # activity labels and subject identifiers are added as new variables
    
test_full <- read.csv("test/X_test.txt", sep="", header=FALSE, col.names=features[,2])
test <- select(test_full,contains(".mean."))
test[,34:66] <- select(test_full,contains(".std."))
test[,67] <- read.csv("test/subject_test.txt", sep="", header=FALSE)
test[,68] <- read.csv("test/Y_test.txt", sep="", header=FALSE)

train_full <- read.csv("train/X_train.txt", sep="", header=FALSE, col.names=features[,2])
train <- select(train_full,contains(".mean."))
train[,34:66] <- select(train_full,contains(".std."))
train[,67] <- read.csv("train/subject_train.txt", sep="", header=FALSE)
train[,68] <- read.csv("train/Y_train.txt", sep="", header=FALSE)

# MERGING 'test' and 'train' sets
    # the descriptive labels for the activities are merged into the set
    # better names are assigned to the added variables
    # activity and subject variables are moved to the first columns

DB <- rbind(train, test)
DB <- merge(DB,activityLabels,by.x="V1.1",by.y="V1",all=TRUE)
DB <- rename(DB, subject = V1, act_label = V1.1, activity = V2)
DB <- DB[c(68,1,69,2:67)]


# CREATING NEW DATA SET - it will be done in two stages
    # first with melt, "grouping" by subject and activity 
    # then with dcast, getting the mean of each variable by group

tidy_t <- melt(DB, id=c("subject","activity", "act_label"))
tidy <- dcast(tidy_t, subject + activity ~ variable, mean)

# SAVING FILE with the new tidy data set

write.table(tidy, file = "./tidy.txt", row.names = FALSE)
