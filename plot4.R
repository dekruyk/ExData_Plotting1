bestand <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(bestand), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
close(bestand)
data$DateTime <- strptime(paste(data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S")
png(file="plot4.png",width = 480, height = 480)
par(mfrow = c(2,2), mar=c(5,4,2,1))
#1
plot(data$DateTime,data$Global_active_power, main="", xlab = "", ylab="Global Active Power", type="l")
#2
plot(data$DateTime,data$Voltage, main="", xlab="datetime", ylab="Voltage", type="l")
#3
plot(data$DateTime,data$Sub_metering_1, main="", xlab = "", ylab="Energy sub metering", type="l", col="black")
lines(data$DateTime,data$Sub_metering_2, type="l", col="red")
lines(data$DateTime,data$Sub_metering_3, type="l", col="blue")
legend(x="topright",y=NULL, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n")
#4
plot(data$DateTime,data$Global_reactive_power, main="", xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()