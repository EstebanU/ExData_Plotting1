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


# plot 3
with(powerConsumption, {
    plot(Time, Sub_metering_1, type = "l", ylim = c(0, 38), xlab = "", ylab = "")
    points(Time, Sub_metering_2, type = "l", col = "red", xlab = "", ylab = "", ylim = c(0, 38)) 
    points(Time, Sub_metering_3, type = "l", col = "blue", xlab = "", ylab = "", ylim = c(0, 38))
})

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

title(ylab = "Energy sub metering")
dev.copy(png, "plot3.png", width = 480, height = 480, units = "px")
dev.off()


# with(powerConsumption, {plot(Time, Sub_metering_1, type = "l", ylim = c(0, 38), 
#                              xlab = "", ylab = "")})
# 
# par(new = TRUE)
# with(powerConsumption, plot(Time, Sub_metering_2, type = "l", col = "red",
#                              xlab = "", ylab = "", ylim = c(0, 38)))
# par(new = TRUE)
# with(powerConsumption, plot(Time, Sub_metering_3, type = "l", col = "blue",
#                              xlab = "", ylab = "", ylim = c(0, 38)))