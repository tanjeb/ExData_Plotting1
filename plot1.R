# read data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                 stringsAsFactors = FALSE)

# subset data according to the dates
subDf <- df[(df$Date %in% c("1/2/2007", "2/2/2007")), ]

#open graphic device and plot
png("plot1.png", width = 480, height = 480)
hist(as.numeric(subDf$Global_active_power), col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
