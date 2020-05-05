#Setup needed libraries before starting:tidyverse,tidyr,data.table
#Set working directory to the folder containing the 'UCI HAR Dataset' folder


setwd("UCI HAR Dataset")

#Read and store all the data to be worked with
xtrain <- read.table("./train/X_train.txt")
ytrain <- read.table("./train/y_train.txt")
xtest <- read.table("./test/X_test.txt")
ytest <- read.table("./test/y_test.txt")
ft <- read.table("features.txt")
#Transform data to tibbles to better work with
xtraintb <- tbl_df(xtrain)
ytraintb <- tbl_df(ytrain)
xtesttb <- tbl_df(xtest)
ytesttb <- tbl_df(ytest)
ft <- tbl_df(ft)
#Merge 'test' and 'train' data for X and y
xtb <- bind_rows(xtraintb,xtesttb)
ytb <- bind_rows(ytraintb,ytraintb)
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
#oldnames <- colnames(xtb)
#newnames <- as.character(pull(ft,V2))
#setnames(xtb, old = oldnames, new = newnames)
#Filter 'features' data for 'mean' and 'standard deviation'
#'Pull' from filtered 'features' column 1 which has the variables labels and store as vector
#vec_variables<-pull(filter(ft,grepl("mean|std",V2)),V1)
#Select and store variables requested on assignment using the vector created before
#select_data<-select(xtb,vec_variables)

