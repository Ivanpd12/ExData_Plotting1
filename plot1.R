## Plot 1
origin<-read.table("household_power_consumption.txt", header = TRUE , sep=";")
origin$Date<-as.character(origin$Date)
dat<-origin[66637:69516,]
dat$Global_active_power<-as.numeric(as.character(dat$Global_active_power))
par(mfrow = c(1,1))

#making the histogram
hist(dat$Global_active_power, col = "red", main = "Global Active Power" , xlab = "Global Active Power (kilowatts)")

#saving the file as a png file
dev.copy(png, file = "plot1.png", width = 480 , height = 480)
dev.off()
