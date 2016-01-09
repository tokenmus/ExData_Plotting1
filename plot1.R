#R Script for completing Assignment 1 - Exploratory Analysis Data Science Coursera

#In this script we will make plot 1 which is a histogram of Global Active Power
#The plot includes x-label "Global Active Power(kilowatts)" and ylabel "Frequency"
#Plot is titled "Global Active Power"
#Histogram is Red


#Step one: Read the data we'll use for creating our plot

filename<-"household_power_consumption.txt"
powerconsumption<-read.csv2(file=filename, header=TRUE, sep=";")


#Step two: Take the relevant subset out of the full dataset

datestokeep<-((powerconsumption$Date=="1/2/2007")|(powerconsumption$Date=="2/2/2007"))
powerconsumptionsubset<-powerconsumption[datestokeep,]


#Step three: Create the plot

hist(as.numeric(as.character(powerconsumptionsubset$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power (kilowatts)")



#Step four: Write the plot to a file

dev.copy(png, file="plot1.png",width = 480, height = 480, units = "px")
dev.off()



