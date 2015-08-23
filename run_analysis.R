library(dplyr)

features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

Column_names <- make.unique(features[,2], sep = "-") 

Test_set <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = Column_names, check.names = F)

Train_set <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = Column_names, check.names = F)

full_data <- rbind(Train_set,Test_set)

selected_data <- cbind(select(full_data, contains("mean()")), select(full_data, contains("std()")))

numeric_activiy_labels_Test <- read.table("./UCI HAR Dataset/test/y_test.txt")

numeric_activiy_labels_Train <- read.table("./UCI HAR Dataset/train/y_train.txt")

numeric_to_descriptive_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

numeric_activiy_labels <- rbind(numeric_activiy_labels_Train, numeric_activiy_labels_Test)

descriptions <- numeric_to_descriptive_labels[,2]

activity_labels <- data.frame(activity = descriptions[numeric_activiy_labels[,1]], stringsAsFactors = FALSE)

act_labeled_data <- cbind(activity_labels, selected_data)

subject_labels_Test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("subject_ID"))

subject_labels_Train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("subject_ID"))

subject_labels <- rbind(subject_labels_Train, subject_labels_Test)

labeled_data <- cbind(subject_labels, act_labeled_data)

group_data <- group_by(labeled_data, subject_ID, activity)

mean_sd_data <- summarise_each(group_data, funs(mean))

write.table(mean_sd_data, "./mean_sd_data.txt", col.names = T, row.names = F)

