Getting and Cleaning Data run_analysis Project Codebook
Download files from source and Unzip
zipURL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(zipURL,destfile ="./Zip.zip")
unzip("./Zip.zip")
Read data into frames for manipulation.  First, correctly label the measures per the features file by saving this as a vector and using the names() function.
The data is in 2 different sets for Test and Train and needs to be merged together.
First merge the componenet of each and then the master test and train dataframes together.  X_ are the primary large datasets of 562 variables.
y provides the activity type in code for each of the observations.  Adding y into x as a new column combines both dataframes.  
Subject tells which of the 30 people who performed the test is measured.  Subject and y are the two ID variables.  
Cbind adds the new columns for Subject and Activity, for the last step of adding test and training data, use Rbind to add data below in rows.
With one large data set, rename the activities the correct name with the merge function and then delete the unnecessary id row.
Next, use the select matches functions to only select columns containing mean() and std().  To read correctly, () is actually written as [(][)].  
For tidy data and later summarizing, melt the data by Activity and Subject with the melt function.
Now summarize on mean using summarize function and group_by Activity, Subject, and Variable.
