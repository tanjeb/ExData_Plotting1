# read data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                 stringsAsFactors = FALSE)

# subset datas according to the dates
subDf <- df[(df$Date %in% c("1/2/2007", "2/2/2007")), ]

# merge date and time and convert into date/time object
dateTime <- strptime(paste(subDf$Date, subDf$Time), format = "%d/%m/%Y %H:%M:%S")

#open graphic device and plot
png("plot2.png", width = 480, height = 480)
plot(dateTime, as.numeric(subDf$Global_active_power), 
     type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()
