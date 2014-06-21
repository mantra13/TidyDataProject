run_analysis <- function () {
   
    #get Features data    
    FeatList <- read.table("./UCI HAR Dataset/features.txt") 
    
    #Feature value modifications
    ModFeatList<-NULL
    
    for (c in FeatList[,2]) {
        
        #removes '-' character
        c<-gsub("-","",c)
        
        #removes '(' and ')' characters
        c<-gsub("\\(\\)","",c)
        
        #changes 'mean' to 'Mean' , 'std' to 'Std' and 'BodyBody' to 'Body'
        if (grepl("mean",c))
            c<-gsub("mean","Mean",c)
        if (grepl("std",c))
            c<-gsub("std","Std",c)
        if (grepl("BodyBody",c))
            c<-gsub("BodyBody","Body",c)
        
        #add modified values into list
        ModFeatList<- rbind(ModFeatList,c)
    }
    
    #combine the modified list to Features dataset
    FeatList <- suppressWarnings(cbind(FeatList,ModFeatList))
    
    #get Train data    
    TrainData <- read.table("./UCI HAR Dataset/train/X_train.txt") 
    #assign colnames to Train dataset from modified features list
    colnames(TrainData) <- FeatList[,3]
        
    #get Train activity data
    TrainActData <- read.table("./UCI HAR Dataset/train/y_train.txt") 
    colnames(TrainActData)<- "Activity"

    #get Train Subject data
    TrainSubData <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    colnames(TrainSubData)<-"Subject"

    #combine the 3 Train datasets
    Trdata <- cbind(TrainSubData, TrainActData )
    
    #get only colnames with 'Mean' in it, leave out colnames with 'MeanFreq' & 'angle' in it 
    Trdata <- cbind(Trdata,TrainData[, which( grepl("Mean",names(TrainData)) & 
                                              !grepl("MeanFreq",names(TrainData)) & 
                                              !grepl("angle",names(TrainData)))])
    #get only colnames with 'Std' in it
    Trdata <- cbind(Trdata,TrainData[,which(grepl("Std",names(TrainData)))])
    
    #get Test data    
    TestData <- read.table("./UCI HAR Dataset/test/X_test.txt") 
    #assign colnames to Test dataset from modified features list
    colnames(TestData) <- FeatList[,3]
    
    #get Test activity data
    TestActData <- read.table("./UCI HAR Dataset/test/y_test.txt") 
    colnames(TestActData)<- "Activity"
    
    #get Test Subject data
    TestSubData <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    colnames(TestSubData)<-"Subject"
    
    #combine the 3 Test datasets
    Tstdata <- cbind(TestSubData, TestActData)

    #get only colnames with 'Mean' in it. leave colnames with 'MeanFreq' & 'angle' in it    
    Tstdata <- cbind(Tstdata,TestData[, which( grepl("Mean",names(TestData)) & 
                                              !grepl("MeanFreq",names(TestData)) & 
                                              !grepl("angle",names(TestData)))])
    #get only colnames with 'Std' in it    
    Tstdata <- cbind(Tstdata,TestData[,which(grepl("Std",names(TestData)))])
    
    #combine Train & Test datasets
    TrainTestData <- rbind(Trdata,Tstdata)
    
    #tidy data
    FinalData <- data.frame()
    for (s in unique(TrainTestData$Subject)) {
       
        #get temp dataset for each subject
        dtemp1<- TrainTestData[(TrainTestData[1] == s),]
        
        #get colmeans for each unique activity
        for (a in unique(dtemp1$Activity)) {
            dtemp2 <- data.frame(colMeans(dtemp1[(dtemp1$Activity == a),-(1:2)]))
            dtemp2 <- t(dtemp2)
            
            dtemp2 <- cbind("Subject"= s, "Activity" = a, dtemp2)
            
            FinalData <- rbind(FinalData, dtemp2)
        }
        #order dataset by Subject & Activity Column
        FinalData <- FinalData[order(FinalData["Subject"],FinalData["Activity"]),]
    }
    
    #get activity labels
    ActLabelData <- read.table("./UCI HAR Dataset/activity_labels.txt") 
    
    #assign activity labels
    FinalData[,"Activity"] <- data.frame(apply(FinalData["Activity"], 2, as.factor))
    levels(FinalData[,"Activity"]) <- ActLabelData[,2]
    row.names(FinalData) <- c(1:nrow(FinalData))
    
    #write the tidy data into txt file
    write.table(FinalData,file="./UCI_HAR_ProcData.txt", col.names=TRUE, row.names=FALSE, sep=",")
    return ("UCI_HAR_ProcData.txt")
    
}
