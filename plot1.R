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

hist(powerConsumption$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, "plot1.png", width = 480, height = 480, units = "px")
dev.off()
