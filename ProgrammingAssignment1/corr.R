################################################################
#Title: Coursera R-Programming Assignment 1 - corr function
#Programmer: Marina W. Kim
#Date: 2016.05.25
################################################################

# Write a function that takes a directory of data files and a threshold for complete cases 
# and calculates the correlation between sulfate and nitrate for monitor locations where the 
# number of completely observed cases (on all variables) is greater than the threshold. The 
# function should return a vector of correlations for the monitors that meet the threshold 
# requirement. If no monitors meet the threshold requirement, then the function should return
# a numeric vector of length 0.

setwd("/Users/Marina/Google Drive/Coursera - Data Science/2 - R Programming/specdata")
specdata <- "/Users/Marina/Google Drive/Coursera - Data Science/2 - R Programming/specdata"

### Question 3
corr <- function(directory, threshold = 0){
    files_full <- list.files(directory, full.names = TRUE)
    
    data <- vector(mode = "numeric", length = 0)
    
    for (i in 1:length(files_full)){
        file_i <- read.csv(files_full[i])
        complete <- sum((!is.na(file_i$sulfate)) & (!is.na(file_i$nitrate)))
        if (complete > threshold){
            complete_sulfate <- file_i[which(!is.na(file_i$sulfate)), ]
            complete_file <- complete_sulfate[which(!is.na(complete_sulfate$nitrate)), ]
            data <- c(data, cor(complete_file$sulfate, complete_file$nitrate))
        }
    }
    
    data
}

