#plot3
origin<-read.table("household_power_consumption.txt", header = TRUE , sep=";")
dat<-origin[66637:69516,]
dat$Global_active_power<-as.numeric(as.character(dat$Global_active_power))
dat$Sub_metering_1<-as.numeric(as.character(dat$Sub_metering_1))
dat$Sub_metering_2<-as.numeric(as.character(dat$Sub_metering_2))
dat$Sub_metering_3<-as.numeric(as.character(dat$Sub_metering_3))
dat$Voltage<-as.numeric(as.character(dat$Voltage))
dat$Global_reactive_power<-as.numeric(as.character(dat$Global_reactive_power))
dat$DateTime <- strptime(paste(dat$Date, dat$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2))

#1
plot(dat$DateTime, dat$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

#2
plot(dat$DateTime, dat$Voltage, xlab = "datatime" , ylab = "Voltage", type = "l")

#3
plot(dat$DateTime,dat$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_2, col = "red")
lines(dat$DateTime, dat$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, box.lwd = 0, cex = 0.6, bty = "n")

#4
plot(dat$DateTime, dat$Global_reactive_power, type = "l", xlab = "datatime", ylab = "Global_reactive_power")

#saving the file as a png file
dev.copy(png, file = "plot4.png", width = 480 , height = 480)
dev.off()
