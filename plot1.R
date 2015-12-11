pwrs <- read.csv("./Data/pwr_subset.txt", header = TRUE, stringsAsFactors = FALSE)

png(file = "plot1.png", width = 480, height = 480)
hist(pwrs$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

