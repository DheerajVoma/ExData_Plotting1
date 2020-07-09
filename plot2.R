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
png("plot2.png",width = 480,height = 480)

with(subdata_used,plot(TotalTimeDate,Global_active_power,xlab="Day",ylab="Global Active Power(kilowatts)",type = "l"))

dev.off()