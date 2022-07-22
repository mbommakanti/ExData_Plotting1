data <- read.csv("household_power_consumption.txt", sep=";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date == "2007-2-1" | data$Date == "2007-2-2",]
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data$Global_active_power  <- as.numeric(data$Global_active_power)


png(filename="plot4.png")

par(mfrow=c(2,2))

with(data, plot(datetime, Global_active_power, type="l", 
                ylab="Global Active Power (kilowatts)",
                xlab="",))

with(data, plot(datetime, Voltage, type = "l", xlab = ""))

with(data, plot(datetime, Sub_metering_1, type="l", col="black", log="",
                lines(datetime, Sub_metering_2, col="red"),
                lines(datetime, Sub_metering_3, col="blue"),
                yaxp = c(0, 30, 3),                
                ylab="Energy sub metering",
                xlab="",                
                legend("topright", lty="solid", col = c("black", "red", "blue"), 
                       legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
))

with(data, plot(datetime, Global_reactive_power, type = "l"))

dev.off()