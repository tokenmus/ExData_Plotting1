#R Script for completing Assignment 1 - Exploratory Analysis Data Science Coursera


#In this script we will make plot 2 which is a time series of Global Active Power over Thu - Sat
#The plot includes y-label "Global Active Power(kilowatts)" and has no x-label
#Plot is not titled 


#Step one: Read the data we'll use for creating our plot
#Step one: Read the data we'll use for creating our plot

filename<-"household_power_consumption.txt"
powerconsumption<-read.csv2(file=filename, header=TRUE, sep=";")


#Step two: Take the relevant subset out of the full dataset

datestokeep<-((powerconsumption$Date=="1/2/2007")|(powerconsumption$Date=="2/2/2007"))
powerconsumptionsubset<-powerconsumption[datestokeep,]


#Step three: Create the plot

timestamp<-strptime(paste(as.character(powerconsumptionsubset$Date),as.character(powerconsumptionsubset$Time)),"%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English") # Ensure we use English labels for days

plot(timestamp, as.numeric(as.character(powerconsumptionsubset$Global_active_power)), yaxp=c(2,6,2), xlab = "", ylab="Global Active Power (kilowatts)", type="l")

#Step four: Write the plot to a file


dev.copy(png, file="plot2.png",width = 480, height = 480, units = "px")
dev.off()

