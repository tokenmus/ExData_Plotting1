#R Script for completing Assignment 1 - Exploratory Analysis Data Science Coursera

#In this script we will make plot 3 which is a time series of the three submeters over Thu - Sat
#The plot includes y-label "Energy sub metering" and has no x-label
#Plot is not titled, but comes with a legend in the upper right box
# Submetering 1 is in black, Submetering 2 is in red, Submetering 3 is in blue


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

Sub_metering_1<-as.numeric(as.character(powerconsumptionsubset$Sub_metering_1))

Sub_metering_2<-as.numeric(as.character(powerconsumptionsubset$Sub_metering_2))

Sub_metering_3<-as.numeric(as.character(powerconsumptionsubset$Sub_metering_3))


plot(timestamp, Sub_metering_1,  type="l", xlab="",  ylab="Energy Sub Metering", col="Black")
lines(timestamp, Sub_metering_2, type="l", col="Red")
lines(timestamp, Sub_metering_3, type="l", col="Blue")
legend("topright", lty=1, lwd=1, col=c("Black","Red","Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Step four: Write the plot to a file

dev.copy(png, file="plot3.png",width = 480, height = 480, units = "px")
dev.off()
