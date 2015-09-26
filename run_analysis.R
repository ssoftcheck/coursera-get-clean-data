library(data.table)
train = read.table(".//train//x_train.txt",header=FALSE,sep="")
test = read.table(".//test//x_test.txt",header=FALSE,sep="")

# load subject labels
train.subject = scan(".//train//subject_train.txt")
test.subject = scan(".//test//subject_test.txt")

# load subject responses and create factors for them
y.train = scan(".//train//y_train.txt")
y.test = scan(".//test//y_test.txt")
labels = read.table("activity_labels.txt")
labels$V2 = gsub("\\_"," ",labels$V2)
y.train = labels$V2[y.train]
y.test = labels$V2[y.test]

# name the columns with the features
features = read.table(".//features.txt",sep = "",stringsAsFactors = FALSE)[,-1]
keep = grep("mean(freq)?\\(\\)|std\\(\\)",features,perl=TRUE,ignore.case=TRUE)
setnames(train,features)
setnames(test,features)

# append the data and rename the variables
df = cbind(data.table(subject=c(train.subject,test.subject),partition=factor(c(rep("TRAIN",nrow(train)),rep("TEST",nrow(test)))),activity=factor(c(y.train,y.test))),rbind(data.table(train[,keep]),data.table(test[,keep])))
temp = tolower(features[keep])
temp = gsub("bodybody","body",temp,perl=TRUE)
temp = gsub("mag","magnitude",temp,perl=TRUE)
temp = gsub("^t","time.",temp,perl=TRUE)
temp = gsub("^f","freq.",temp,perl=TRUE)
temp = gsub("\\-(mean(freq)?|std)\\(\\)\\-?",".\\1.",temp,perl=TRUE)
temp = gsub("acc","acceleration",temp)
temp = gsub("(body|gravity|gyro|jerk|acceleration)","\\1.",temp,perl=TRUE)
temp = gsub("(\\.{2,})",".",temp)
temp = gsub("\\.$","",temp)
setnames(df,c(names(df)[1:3],temp))

# create the summary table of averges by subject+activity
setkey(df,"subject","activity")
averages = df[,lapply(.SD,mean),by=list(subject,activity),.SDcols=setdiff(names(df),c("partition","subject","activity"))]
averages = merge(unique(df[,.(subject,partition)]),averages,by="subject")

rm(temp,features,keep,labels,y.train,y.test,test.subject,train.subject,train,test)

write.table(averages,"Averages.txt",row.names = FALSE)
