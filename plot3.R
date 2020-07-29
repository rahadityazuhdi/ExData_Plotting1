power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_metering1 <- as.numeric(subpower$Sub_metering_1)
sub_metering2 <- as.numeric(subpower$Sub_metering_2)
sub_metering3 <- as.numeric(subpower$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sub_metering1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, sub_metering2, type = "l", col = "red")
lines(datetime, sub_metering3, type = "l", col = "blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), 
       lty = 1, lwd = 2.5,
       col = c("black", "red","blue"))
dev.off()