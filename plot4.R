library(lubridate)
dataNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
               "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
               "Sub_metering_3")
powerConsumption <- read.table("household_power_consumption.txt", sep = ";", 
                               col.names = dataNames, nrows = 2880, skip = 66637,
                               stringsAsFactors = FALSE)

# coverts date variable to Date class
powerConsumption$Date <- as.Date(strptime(powerConsumption$Date, "%e/%m/%Y"))

# converts time variable to date/time class
powerConsumption$Time <- ymd_hms(paste(powerConsumption$Date, powerConsumption$Time))

par(mfrow = c(2, 2))

# plot 1
plot(powerConsumption$Time, powerConsumption$Global_active_power,
     ylab = "Global Active Power", xlab = "", type = "l")

# plot 2
with(powerConsumption, plot(Time, Voltage, xlab = "datetime", 
     ylab = "Voltage", type = "l"))

# plot 3
with(powerConsumption, {
    plot(Time, Sub_metering_1, type = "l", ylim = c(0, 38), xlab = "", ylab = "")
    points(Time, Sub_metering_2, type = "l", col = "red", xlab = "", ylab = "", ylim = c(0, 38)) 
    points(Time, Sub_metering_3, type = "l", col = "blue", xlab = "", ylab = "", ylim = c(0, 38))
    title(ylab = "Energy sub metering")
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")


# plot 4
with(powerConsumption, plot(Time, Global_reactive_power, xlab = "datetime", 
                            ylab = "Global_reactive_power", type = "l"))



dev.copy(png, "plot4.png", width = 480, height = 480, units = "px")
dev.off()

