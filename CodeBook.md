
Before run script run_analysis.R. please unzip zipfile into your current work directory.

In script run_analysis.R,first we read data into R.Read x_test,ytest,subject_test,x_train,y_train,subject_train,features,activity_label files in to R.

Then we start to merge these files in to a big new dataset in following steps: 

1.Appropriately labels the data set with descriptive variable name for dataset x_train and x_test
2.Merge test/train groups dataset subject and activity file into new datasets merge1 and merge2
3,Append activity label to merge1 and merge2.And we get new set mergeactivity and mergeactivity1 correspond train/test groups.
4.set colname for set mergeactivity and mergeactivity1.the colnames are "activity_rank"","subject"","activity".
5.Combine sets mergeactivity and mergeactivity1 into new set mergetotal. Combine dataset x_train and x_test into newset mergetotal1
6.combine mergetotal and mergetotal1 into final dataset mergedone.

After we got the merged datset, we extracts only the measurements on the mean and standard deviation for each measurement. the new set named newset

At last we use function aggregate() to creates aindependent tidy data set with the average of each variable for each activity and each subject. The data set named sum_set and output a txt file named sum_set.txt in your work directory.