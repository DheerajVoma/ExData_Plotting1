#reading data from text file
power_consumption <- read.table("household_power_consumption.txt",header = TRUE,sep=";")

# creating a datetime column
TotalTimeDate <- strptime(paste(power_consumption$Date, power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#Binding with orginal data
power_consumption <- cbind(power_consumption,TotalTimeDate)



#Changing Formats of date and time and others
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")
power_consumption$Time <- strptime(power_consumption$Time, format="%H:%M:%S")
power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)


#Subsetting the data of those 2 dates
subdata_used <- subset(power_consumption, Date == "2007-02-01" | Date =="2007-02-02")

#printing the data in the png format
png("plot4.png",width = 480,height = 480)

par(mfrow=c(2,2))

#1st plot
with(subdata_used,plot(TotalTimeDate,Global_active_power,xlab="Day",ylab="Global Active Power(kilowatts)",type = "l"))
#2nd plot
with(subdata_used, plot(TotalTimeDate, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
#3rd plot
with(subdata_used,plot(TotalTimeDate,Sub_metering_1,xlab="Day",ylab="Energy sub metering",type = "l"))
lines(subdata_used$TotalTimeDate,subdata_used$Sub_metering_2,xlab="Day",ylab="Energy sub metering",type = "l",col="red")
lines(subdata_used$TotalTimeDate,subdata_used$Sub_metering_3,xlab="Day",ylab="Energy sub metering",type = "l",col="blue")
legend(c("topright"),legend =  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
#4th plot
with(subdata_used, plot(TotalTimeDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.off()