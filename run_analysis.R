
#read data into R

x_test<-read.table("./test/X_test.txt",header=TRUE)
y_test<-read.table("./test/y_test.txt",header=TRUE)
subject_test<-read.table("./test/subject_test.txt",header=TRUE)

x_train<-read.table("./train/X_train.txt",header=TRUE)
y_train<-read.table("./train/y_train.txt",header=TRUE)
subject_train<-read.table("./train/subject_train.txt",header=TRUE)

feature<-read.table("./features.txt")
activity<-read.table("./activity_labels.txt") 

feature1<-feature[,2]
feature1<-as.character(feature1)
feature1<-t(feature1)

#Appropriately labels the data set with descriptive variable name for dataset x_train and x_test

colnames(x_train)=c(feature1)
colnames(x_test)=c(feature1)

#Merges the training and the test sets to create one data set.
#In train group, merge subject and activity from dataset subject_tarin and y_train

merge1<-cbind(subject_train,y_train)

#append activity label name to the merged subject and activity set

mergeactivity<-merge(merge1,activity,by.x="X5",by.y="V1",all=TRUE,sort=FALSE)

#In test group, merge subject and activity from dataset subject_test and y_test

merge2<-cbind(subject_test,y_test)

#append activity label name to the merged subject and activity set

mergeactivity1<-merge(merge2,activity,by.x="X5",by.y="V1",all=TRUE,sort=FALSE)

#Appropriately labels the data set with descriptive variable name

colnames(mergeactivity)<-c("activity_rank","subject","activity")
colnames(mergeactivity1)<-c("activity_rank","subject","activity")

#combine merged dataset subject and activity from test and train group.

mergetotal<-rbind(mergeactivity,mergeactivity1)

#combine dataset x_train and x_test into newset mergetotal

mergetotal1<-rbind(x_train,x_test)

#make final dataset named mergedone that include x_test,x_train,subject and activity set. it has 10297 rows and 564 columns

mergedone<-cbind(mergetotal1,mergetotal)

#Extracts only the measurements on the mean and standard deviation for each measurement.We get the dataset named newset
tempdata<-grep(("mean|std"),feature1)
newset<-mergedone[,tempdata]

#Creates a independent tidy data set with the average of each variable for each activity and each subject.
#We get a new dataset named sum_set
sum_set<-aggregate(mergedone[,1:563], by=list(mergedone$subject,mergedone$activity_rank),FUN=mean, na.rm=TRUE)
write.table(sum_set,"./sum_set.txt")

