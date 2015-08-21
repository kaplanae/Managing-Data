zipURL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(zipURL,destfile ="./Zip.zip")
unzip("./Zip.zip")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
head(test)
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
labels <-read.table("./UCI HAR Dataset/activity_labels.txt")
features <-read.table("./UCI HAR Dataset/features.txt")
vector <- as.vector(features[,2])
names(x_test) <- vector
names(x_train) <- vector
x_test <-cbind(subject_test,x_test)
x_train <- cbind(subject_train,x_train)
test_bind <- cbind(y_test, x_test)
train_bind <- cbind(y_train, x_train)
total <-rbind(test_bind, train_bind)

names(total)[1] <- "id"
names(total)[2] <- "Subject"
names(labels)[1] <- "id"
total <- merge(labels,total)
total$id <- NULL
names(total)[1] <- "Activity"
library(dplyr)
filterTotal <- select(total, matches("Activity|Subject|-mean[(][)]|-std[(][)]"))
groupTotal <- group_by(filterTotal, Activity, Subject)
install.packages("reshape")
library(reshape2)
meltData <- melt(sumTotal,id.vars=1:2, measure.vars= 3:68)
names(meltData)[3]= "Variable"
names(meltData)[4]= "Values"
sumTotal <- summarize(group_by(meltData,Activity,Subject, Variable), Mean= mean(Values))
?summarize()
ncol(sumTotal)
?melt()
write.table(sumTotal, "output.txt", sep="\t", row.name=FALSE)




#Other Functions Evaluated
#?group_by()
#?grep()
#?select()
#?subset()
#?ifelse()
#?mutate()
#?merge()
#head(test_bind)
#table(y_test)

