#Setup needed libraries before starting:dplyr,tidyr,data.table
#Set working directory to the folder containing the 'UCI HAR Dataset' folder

library(data.table)
library(tidyr)
library(dplyr)

#Read and store all the data to be worked with

zipdata <- paste(getwd(),"/data.zip", sep = "")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zipdata)

xtrain <- read.table(unz(zipdata, "UCI HAR Dataset/train/X_train.txt"))
ytrain <- read.table(unz(zipdata, "UCI HAR Dataset/train/y_train.txt"))
subjecttrain <- read.table(unz(zipdata, "UCI HAR Dataset/train/subject_train.txt"))

xtest <- read.table(unz(zipdata, "UCI HAR Dataset/test/X_test.txt"))
ytest <- read.table(unz(zipdata, "UCI HAR Dataset/test/y_test.txt"))
subjecttest <- read.table(unz(zipdata, "UCI HAR Dataset/test/subject_test.txt"))

ft <- read.table(unz(zipdata, "UCI HAR Dataset/features.txt"))

#Transform data to tibbles to better work with

xtraintb <- tbl_df(xtrain)
ytraintb <- tbl_df(ytrain)
subjecttraintb <- tbl_df(subjecttrain)

xtesttb <- tbl_df(xtest)
ytesttb <- tbl_df(ytest)
subjecttesttb <- tbl_df(subjecttest)

ft <- tbl_df(ft)

#Merge 'test' and 'train' data for X and y

xtb <- bind_rows(xtraintb,xtesttb)
ytb <- bind_rows(ytraintb,ytesttb)
subjecttb <- bind_rows(subjecttraintb,subjecttesttb)

#Add corresponding names to variables and labels

ytb_names <- ytb %>% mutate(coly = factor(
  ifelse(V1 == "1", "WALKING",
         ifelse(V1 == "2", "WALKING_UPSTAIRS",
                ifelse(V1 == "3","WALKING_DOWNSTAIRS",
                       ifelse(V1 == "4", "SITTING",
                              ifelse(V1 == "5", "STANDING",
                                     ifelse(V1 == "6", "LAYING", V1))))))))
ytb_names <- ytb_names %>% select(coly) %>% rename(V1=coly)

#Change names to data set variables

new_names <- as.character(pull(filter(ft, grepl("mean|std", V2)), V2)) #Create vector with new names of variables taken from features data
vec_variables <- pull(filter(ft, grepl("mean|std", V2)), V1) #Create vector of features with specified filter "mean" and "std"
select_data <- select(xtb, vec_variables) #Filter dataset with features vector created above
old_names <- colnames(select_data) #Create vector of original dataset names to be replaced
setnames(select_data, old = old_names, new = new_names) #Replace old names with new names

select_data <- rename(bind_cols(ytb_names, select_data),'Activity' = 'V1') #Bind activities data (y) to variables data (X)
select_data <- rename(bind_cols(subjecttb, select_data), 'Subject' = 'V1') #Bind subjects data to the rest of data set

#Create summarised dataset 

summary_data <- select_data %>% group_by(Subject, Activity) %>% summarise_at(new_names, mean)

#Display data

select_data
summary_data

write.csv(select_data, 'tidy_filtered_data.csv')
write.csv(summary_data, 'summary_data.csv')