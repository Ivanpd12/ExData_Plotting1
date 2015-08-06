#plot2
origin<-read.table("household_power_consumption.txt", header = TRUE , sep=";")
dat<-origin[66637:69516,]
dat$Global_active_power<-as.numeric(as.character(dat$Global_active_power))
dat$DateTime <- strptime(paste(dat$Date, dat$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
par(mfrow = c(1,1))

#making the plot
plot(dat$DateTime,dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#saving the file as a png file
dev.copy(png, file = "plot2.png", width = 480 , height = 480)
dev.off()
