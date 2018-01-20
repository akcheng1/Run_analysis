run_analysis <- function(){
#require(reshape2)
  # 1) load data into variables in order to combine later
  subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')
  X_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
  y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
  
  subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
  X_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
  y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
  
  #1) combine the data
  subject <- rbind(subject_test, subject_train)
  X <- rbind(X_test, X_train)
  y <- rbind(y_test, y_train)
  
  names(subject) <- "subject"
  names(y) <- "activity"
  
  #load activities
  activity_label <- read.table('./UCI HAR Dataset/activity_labels.txt')
  
  
  #2) extracts only column names with mean or standard deviation
  features <- read.table('./UCI HAR Dataset/features.txt')
  features[,2] <- sapply(features[,2], function(x){gsub("[()]","", x)}) #3) add descriptive names, cleans up parenthesis
  
  mean_std_index <- grep("mean|std", features[,2]) #only has mean and std fields
  X_final <- X[,mean_std_index]
  names(X_final) <- features[mean_std_index,2]
  dataset <- cbind(subject, y, X_final)
  
  
  #3, 4) use the actual activity names instead of the numbers
  activities <- factor(dataset[,2])
  levels(activities) <- activity_label[,2]
  dataset[,2] <- activities
  
  #5) create second, independent tidy data set with average for activty/subject
  data_temp <- melt(dataset, id.vars = c("subject", "activity")) #3) add descriptive names
  dataset_tidy <- dcast(data_temp, subject + activity ~ variable, mean)
  
  #return a text file of tidy data
  write.table(dataset_tidy, file = "tidydataset.txt", sep = "\t", row.names = FALSE)
}


