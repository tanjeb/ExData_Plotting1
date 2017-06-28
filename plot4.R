# read data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                 stringsAsFactors = FALSE)

# subset datas according to the dates
subDf <- df[(df$Date %in% c("1/2/2007", "2/2/2007")), ]

# merge date and time and convert into date/time object
dateTime <- strptime(paste(subDf$Date, subDf$Time), format = "%d/%m/%Y %H:%M:%S")

#open graphic device and plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(dateTime, as.numeric(subDf$Global_active_power), 
     type = "l", xlab = "", ylab = "Global Active Power")

plot(dateTime, as.numeric(subDf$Voltage), type = "l",
     ylab = "Voltage")

plot(dateTime, as.numeric(subDf$Sub_metering_1), 
     col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
points(dateTime, as.numeric(subDf$Sub_metering_2), 
       col = "red", type = "l")
points(dateTime, as.numeric(subDf$Sub_metering_3), 
       col = "blue", type = "l")

legend("topright", legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       lty=c(1, 1, 1), col=c("black", "red", "blue"))

plot(dateTime, as.numeric(subDf$Global_reactive_power), 
     type = "l", ylab = "Global Reactive Power")

dev.off()
