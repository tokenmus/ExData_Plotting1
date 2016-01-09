#R Script for completing Assignment 1 - Exploratory Analysis Data Science Coursera

#In this script we will make plot 4 which is a 2 x 2 panel with 4 subplots
#Plot in topleft is identical to plot2
#Plot in topright is timeseries of Voltage with xlabel datetime and ylabel
#Plot lowleft is identical to plot3
#Plot lowright is timeseries of GLobal_reactive_power with xlabel datetime and ylabel



#Step one: Read the data we'll use for creating our plot

#Step one: Read the data we'll use for creating our plot

filename<-"household_power_consumption.txt"
powerconsumption<-read.csv2(file=filename, header=TRUE, sep=";")


#Step two: Take the relevant subset out of the full dataset

datestokeep<-((powerconsumption$Date=="1/2/2007")|(powerconsumption$Date=="2/2/2007"))
powerconsumptionsubset<-powerconsumption[datestokeep,]


#Step three: Create the plot

par(mfrow = c(2, 2))


plot(timestamp, as.numeric(as.character(powerconsumptionsubset$Global_active_power)), yaxp=c(2,6,2), xlab = "", ylab="Global Active Power (kilowatts)", type="l")

plot(timestamp, as.numeric(as.character(powerconsumptionsubset$Voltage)), yaxp=c(2,6,2), xlab = "datetime", ylab="Voltage", type="l")

Sub_metering_1<-as.numeric(as.character(powerconsumptionsubset$Sub_metering_1))

Sub_metering_2<-as.numeric(as.character(powerconsumptionsubset$Sub_metering_2))

Sub_metering_3<-as.numeric(as.character(powerconsumptionsubset$Sub_metering_3))


plot(timestamp, Sub_metering_1,  type="l", xlab="",  ylab="Energy Sub Metering", col="Black")
lines(timestamp, Sub_metering_2, type="l", col="Red")
lines(timestamp, Sub_metering_3, type="l", col="Blue")

legend("topright", lty=1, lwd=0, col=c("Black","Red","Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

plot(timestamp, as.numeric(as.character(powerconsumptionsubset$Global_reactive_power)), yaxp=c(2,6,2), xlab = "datetime", ylab="Global_reactive_power", type="l")


#Step four: Write the plot to a file


dev.copy(png, file="plot4.png",width = 480, height = 480, units = "px")
dev.off()

