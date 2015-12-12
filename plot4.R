library(lubridate)
library(data.table)

# read in file
pwrs <- read.csv("./Data/pwr_subset.txt", header = TRUE, stringsAsFactors = FALSE)
pwrs$Tstamp <- ymd_hms(paste(pwrs$Date,pwrs$Time))

par(mfcol = c(2,2))

# Create plot1
with(pwrs, plot(Tstamp,Global_active_power,type="l", ylab="Global Active Power", xlab=""))

#Create plot2
with(pwrs, plot(Tstamp,Sub_metering_1,type="l", ylab="Energy sub metering", xlab=""))
with(pwrs, points(Tstamp,Sub_metering_2,type="l", col = "Red"))
with(pwrs, points(Tstamp,Sub_metering_3,type="l", col = "Blue"))
legend("top", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.75)

#Create plot3
with(pwrs, plot(Tstamp,Voltage,type="l", ylab="Voltage", xlab="datetime"))

#Create plot4
with(pwrs, plot(Tstamp,Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="datetime"))

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()


