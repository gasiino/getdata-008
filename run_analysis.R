
##1. Merges the training and the test sets to create one data set.

# get zip file 
#download.file("https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip","UCI HAR Dataset.zip")
#(not repeated here as it would not make sense to download the file each time).

#unzip the file:
unzip("UCI HAR Dataset.zip",exdir=".")
#files are unzipped in current folder as the zip file contains a folder "UCI HAR Dataset"

subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE)
x_test<-read.table("UCI HAR Dataset/test/x_test.txt",header=FALSE)
y_test<-read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE,col.names=c("n"))

subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE)
x_train<-read.table("UCI HAR Dataset/train/x_train.txt",header=FALSE)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE,col.names=c("n"))

train<-data.frame(subject_train, y_train,type="train",x_train)
test<-data.frame(subject_test, y_test,type="test",x_test)
dataset<-rbind(test,train)

##2. Extracts only the measurements on the mean and standard deviation for each measurement. 
con <- file("UCI HAR Dataset/features.txt", "r", blocking = FALSE)
feat_temp<-readLines(con)
close(con)

feat_temp<-gsub("-"," ",feat_temp)
features<- read.table(textConnection(feat_temp),header=FALSE,fill=TRUE, colClasses=c("integer",rep("character",3)), col.names=c("n","signal","variable","direction"))
features$name<-paste("feature",as.character(features$n),sep="")
index<-features$variable=="mean()" | features$variable=="std()"
features$name[index]<-paste(features$signal,features$variable,features$direction,sep="-")[index]

removecols<-grep("feature",features$name) #,value=TRUE)
dataset<-dataset[ -(removecols+3)]

##3. Uses descriptive activity names to name the activities in the data set
activities<-read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE, colClasses=c("integer","character"), col.names=c("n","label"))
dataset[,2]<-activities$label[dataset[,2]]

##4. Appropriately labels the data set with descriptive variable names. 
colnames(dataset)<-c("subject","activity","type",features[!features$n %in% removecols,"name"])

##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#dataset with means per subject and activity only
cleandataset<-aggregate(.~activity+subject, data=dataset[,-3], mean)

##6. [save] your data set as a txt file created with write.table() using row.name=FALSE 
write.table(cleandataset,file="cleandataset.txt",row.names=FALSE)



