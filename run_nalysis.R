library("dplyr")


## PREP
#######################################
# Setup work dir
org_wd <- getwd()
new_wd <- file.path(org_wd, paste("work", format(Sys.time(), "%Y%m%d-%H%M%S"), sep = "."))
dir.create(new_wd, showWarnings = FALSE)
setwd(new_wd)

# Download data and unzip
tmp <- "./data.zip"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", tmp, "curl")
unzip(tmp)


## STEP1 : Merges the training and the test sets to create one data set.
#######################################
# Read test data
d <- "./UCI HAR Dataset/test"
sbj <- read.table(file.path(d, "subject_test.txt"))
x <- read.table(file.path(d, "X_test.txt"))
y <- read.table(file.path(d, "y_test.txt"))
test <- cbind(sbj, x, y)
# Read train data
d <- "./UCI HAR Dataset/train"
sbj <- read.table(file.path(d, "subject_train.txt"))
x <- read.table(file.path(d, "X_train.txt"))
y <- read.table(file.path(d, "y_train.txt"))
train <- cbind(sbj, x, y)
# Read labels
d <- "./UCI HAR Dataset"
f <- read.table(file.path(d, "features.txt"))
r <- read.table(file.path(d, "activity_labels.txt"))
colnames(r) <- c("actlavel", "activity")
# Create dataset
dataset <- rbind(test, train)
colnames(dataset) <- c("subject", as.character(f[,2]), "actlavel")


## STEP2 : Extracts only the measurements on the mean and standard deviation for each measurement.
cs <- grepl("subject|activity|mean|std", colnames(dataset))
tdata <- dataset[, cs]


## STEP3 : Uses descriptive activity names to name the activities in the data set
tdata <- merge(tdata, r) %>% select(-actlavel)


## STEP4 : Appropriately labels the data set with descriptive variable names.
cns <- colnames(tdata)
cns <- gsub("^f", "frequencyDomain-", cns)
cns <- gsub("^t", "timeDomain-", cns)
colnames(tdata) <- cns

## STEP5 : Creates tidy data set with the average of each variable for each activity and each subject.
out <- tdata %>% group_by(activity, subject) %>% summarize_all(funs(mean))

## FIN
#######################################
write.table(out, "tidy.txt") 
setwd(org_wd)