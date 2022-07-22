data <- read.csv("household_power_consumption.txt", sep=";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date == "2007-2-1" | data$Date == "2007-2-2",]
data$Time <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data$Global_active_power  <- as.numeric(data$Global_active_power)

png(filename="plot3.png")

with(data, plot(Time, Sub_metering_1, type="n",
                yaxp = c(0, 30, 3),
                ylab="Energy sub metering",
                xlab=""))
with(data, lines(Time, Sub_metering_1))
with(data, lines(Time, Sub_metering_2, col="red"))
with(data, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty="solid", col = c("black", "red", "blue"), 
       legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
dev.off()