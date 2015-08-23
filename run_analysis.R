#Read the data and label files
features <- read.table("features.txt", stringsAsFactors = FALSE)
activity_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)

train <- read.table("train/X_train.txt")
train_labels <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

test <- read.table("test/X_test.txt")
test_labels <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#Merge the train and test sets
total <- rbind(train, test)
total_labels <- rbind(train_labels, test_labels)
subject_total <- rbind(subject_train, subject_test)

#Name the variables with column names given in "features.txt"
colnames(total) <- features[, 2]
colnames(total_labels) <- c("Activity")
colnames(subject_total) <- c("Subject")

#Change Activity into factor with levels given in "activity_labels.txt"
total_labels$Activity <- factor(total_labels$Activity, labels = activity_labels[, 2])

#Select only label containing string "std" or "mean"
stdormean <- grepl("std", features[, 2]) | grepl("mean", features[, 2])

#Merge subject, train labels and selected data into one dataset
total_clean <- cbind(subject_total, total_labels, total[, stdormean])

#Compute the mean of each value and create new tidy dataset
tidy <- total_clean %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
write.table(tidy, file = "tidy.txt", row.name=FALSE)