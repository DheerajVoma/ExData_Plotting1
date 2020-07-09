#reading data from text file
power_consumption <- read.table("household_power_consumption.txt",header = TRUE,sep=";")


#Changing Formats of date and time and others
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")
power_consumption$Time <- strptime(power_consumption$Time, format="%H:%M:%S")
power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)


#Subsetting the data of those 2 dates
subdata_used <- subset(power_consumption, Date == "2007-02-01" | Date =="2007-02-02")

#printing the data in the png format
png("plot1.png",width = 480,height = 480)

hist(subdata_used$Global_active_power,col="red",xlab = "Global Active Power(kilowatts)",ylab = "Frequency",main="Gobal Active Power", border = "black")

dev.off()