library(lubridate)
library(data.table)

pwrs <- read.csv("./Data/pwr_subset.txt", header = TRUE, stringsAsFactors = FALSE)

pwrs <- transform(pwrs, Date = as.Date(Date,"%Y-%m-%d"))

pwrs$Tstamp <- ymd_hms(paste(pwrs$Date,pwrs$Time))

png(file = "plot2.png", width = 480, height = 480)

plot(pwrs$Tstamp,pwrs$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()