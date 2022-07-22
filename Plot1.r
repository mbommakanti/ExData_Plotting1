setwd("C:/Users/19403/Desktop/Courses/COURSE CERTIFICATES/Johns Hopkins/4EXPLORATORY DATA ANALYSIS/Week 1 Project/exdata_data_household_power_consumption")
powerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, 
+                       stringsAsFactors=FALSE)
head(powerData)
powerData$DateTime <- paste(powerData$Date, powerData$Time)
powerData$DateTime <- as.Date(powerData$DateTime, format = "%d/%m/%Y %H:%M:%S")
library(dplyr)
png(file='plot1.png',height=480,width=480)
with(powerDataSubset,hist(Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power(kilowatts)',ylab='Frequency'))
dev.off()