# GettingandCleaningData

This final assignment for the Getting and Cleaning Data class at Coursera was approached in a ver straightforward manner. 
A fairly large data set was given in scrambled parts and the first task was to identify all these parts to know exactly what was needed to get the required product. 

The core of the data was identified to be in the 'X' datasets. The original data is stored in the different 'signals' files. The raw data in the signals files was processed (the README has some information as to the kind of calculations and signal processing techniques were used) and dumped into the 'X' datasets. 

These raw data signals were not used for this assignment. Instead, the data used was the processed data stored in the 'X_train' and 'X_test' files. 

The other parts of the data correspond to the labels of the variables, activities and subjects.
The labels corresponding to the activity performed in each observation was stored in the 'y_train' and 'y_test' in the form of a single column numerical data ranging from 1 to 6 (each number corresponding to a different activity. The length of this column corresponds with the length of columns from the 'X' sets.

There is also a 'features' data given as single column data set, similar to the 'y' sets. The 'features' set, however has a length corresponding to the amount of variables in the 'X' sets, which confirms it to serve as labels for the variables in 'X'.

The 'subjects_train' and 'subjects_test' sets are given similarly to the 'y' sets with its numerical values ranging from 1 to 30, corresponding to the 30 subjects evaluated for this experiment. The length of these sets corresponds to the length of both 'y' and 'X' sets. 

The first part of the script deals with downloading the data and storing it in convenient variables. As instructed, the script then takes the 'training' and 'test' data from the 'X', 'y' and 'subject' sets and binds it together to create a single data set. This was done with a row binding function were the 'test' rows were added after the last 'train' row.

After this, the script crunches through the different data sets to have the variables in each labeled appropriately. The 'y' numerical data is changed to its corresponding activities labels. The 'mean' and 'standard deviation' variables are selected from the 'X' data to create a new data set of selected data. The 'features' labels were filtered as well to only have the 'mean' and 'std' variables and then these labels were used to name the variables in the new selected data set. To complete the selected data, the activities and subject columns were joined to the new selected data. 

The last part of the assignment required that the new selected data be used to pull averages of each variable for each activity and subject. For this, a double grouping was required to group the data first by Subject and then by Activity. 

The final output of the script are the two tibbles 'select_data' and 'summary_data' and their corresponding csv tables. 
