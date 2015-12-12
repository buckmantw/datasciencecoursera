library(lubridate)
library(data.table)

pwrs <- read.csv("./Data/pwr_subset.txt", header = TRUE, stringsAsFactors = FALSE)

pwrs <- transform(pwrs, Date = as.Date(Date,"%Y-%m-%d"))

pwrs$Tstamp <- ymd_hms(paste(pwrs$Date,pwrs$Time))


png(file = "plot3.png", width = 480, height = 480)

with(pwrs, plot(Tstamp,Sub_metering_1,type="l", ylab="Energy sub metering", xlab=""))
with(pwrs, points(Tstamp,Sub_metering_2,type="l", col = "Red"))
with(pwrs, points(Tstamp,Sub_metering_3,type="l", col = "Blue"))
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()