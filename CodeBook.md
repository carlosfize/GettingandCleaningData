# Code Book

zip_data: This variable is used to store a directory for the zip file to be downloaded.

xtrain, ytrain, subjecttrain: These variables are used to store the data from the corresponding training files.

xtest, ytest, subjecttest: These variables are used to store the data from the corresponding test files.

ft: This variable is used to store the 'features' data.

xtraintb, ytraintb, subjecttraintb: These variables are used to store the data from the corresponding training files as tibbles.

xtesttb, ytesttb, subjecttesttb: These variables are used to store the data from the corresponding test files as tibbles.

xtb, ytb, subjecttb: These variables are used to store the binded data from the corresponding training and test files.

ytb_names: This variable is used to store the previous ytb with its numerical data swapped with the corresponding activities labels.

new_names: This variable stores the filtered variable labels to be used after the xtb data set is filtered. This is done by filtering the features (ft) data for the requested 'mean' and 'standard deviation' features. 

vec_variables: This variable stores the corresponding indices of the labels stored in new_names. This will be used to filter the xtb data. 

select_data: This variable stores the filtered xtb data to only have the data corresponding to the requested 'mean' and 'standard deviation'.

old_names: The variable stores the existing variable names in the selected data. This, along with the 'new_names' vector, will be used on the set.names function to apply the features labels to the variables. 

summary_data: This variable is used to store the requested summary of the data by averaging across Activity and Subjects each variable.
