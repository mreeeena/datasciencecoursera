################################################################
#Title: Coursera R-Programming Assignment 1 - complete function
#Programmer: Marina W. Kim
#Date: 2016.05.25
################################################################

# Write a function that reads a directory full of files and reports the number of completely 
# observed cases in each data file. The function should return a data frame where the first 
# column is the name of the file and the second column is the number of complete cases. 

setwd("/Users/Marina/Google Drive/Coursera - Data Science/2 - R Programming/specdata")
specdata <- "/Users/Marina/Google Drive/Coursera - Data Science/2 - R Programming/specdata"

### Question 2
complete <- function(directory, id = 1:332){
    files_full <- list.files(directory, full.names = TRUE)
    
    data <- data.frame(id = numeric(), nobs = numeric())
    for (i in id){
        file_i <- read.csv(files_full[i])
        nobs <- sum(complete.cases(file_i))
        row_i <- data.frame(i, nobs)
        data <- rbind(data, row_i)
    }
    
    data
}

