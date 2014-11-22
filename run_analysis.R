#get the tes info
test_x <- read.csv("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
test_y <- read.csv("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
test_subject <- read.csv("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
merged_test = cbind(test_x,test_y)
merged_test = cbind(merged_test,test_subject)

#ge the test info
train_x <- read.csv("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
train_y <- read.csv("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
train_subject <- read.csv("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
merged_train = cbind(train_x,train_y)
merged_train = cbind(merged_train, train_subject)

#merge test and train and change the names of column
merged <- rbind(merged_test, merged_train)
features <- read.csv("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", sep="", header=FALSE)
newNames <- as.character(features$V2)
#print(newNames)
newNames <- c(newNames, "activity", "subject")
colnames(merged) <- newNames
#names(merged)[562] <- "activity"
#names(merged)[563] <- "subject"

#get feature list and find relevent ones
vector <- with(features, grepl("mean\\(\\)|std\\(\\)",V2))
vector <- c(vector, TRUE, TRUE)
trimed <- merged[,vector]

#replace the activity name
trimed$activity[trimed$activity == 1] <- "WALKING"
trimed$activity[trimed$activity == 2] <- "WALKING_UPSTAIRS"
trimed$activity[trimed$activity == 3] <- "WALKING_DOWNSTAIRS"
trimed$activity[trimed$activity == 4] <- "SITTING"
trimed$activity[trimed$activity == 5] <- "STANDING"
trimed$activity[trimed$activity == 6] <- "LAYING"

#summarise
melted <- melt(trimed, id.vars=c("activity", "subject"))
summary <- ddply(melted, c("activity", "subject", "variable"), summarise, mean = mean(value))
