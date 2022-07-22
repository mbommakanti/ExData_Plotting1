data <- read.csv("household_power_consumption.txt", sep=";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date == "2007-2-1" | data$Date == "2007-2-2",]
data$Time <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data$Global_active_power  <- as.numeric(data$Global_active_power)

png(filename="plot2.png")
with(data, plot(Time, Global_active_power, type="l", 
                ylab="Global Active Power (kilowatts)",
                xlab="",))
dev.off()