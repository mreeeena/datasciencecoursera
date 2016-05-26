################################################################
#Title: Coursera R-Programming Assignment 1 - pollutantmean function
#Programmer: Marina W. Kim
#Date: 2016.05.25
################################################################

# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or 
# nitrate) across a specified list of monitors. The function 'pollutantmean' takes three 
# arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 
# 'pollutantmean' reads that monitors' particulate matter data from the directory specified 
# in the 'directory' argument and returns the mean of the pollutant across all of the 
# monitors, ignoring any missing values coded as NA. 

setwd("/Users/Marina/Google Drive/Coursera - Data Science/2 - R Programming/specdata")
specdata <- "/Users/Marina/Google Drive/Coursera - Data Science/2 - R Programming/specdata"

### Question 1
pollutantmean <- function(directory, pollutant, id = 1:332) {
    files_full <- list.files(directory, full.names = TRUE)
    
    data <- data.frame()
    for (i in id){
        data <- rbind(data, read.csv(files_full[i]))
    }
    
    mean(data$pollutant, na.rm = TRUE)
}

