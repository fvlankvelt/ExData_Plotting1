pc <- read.csv('household_power_consumption.txt', sep=';', colClasses="character")
spc <- subset(pc, pc$Date == "1/2/2007" | pc$Date == "2/2/2007")
spc$Global_active_power <- as.numeric(spc$Global_active_power)
png(filename="plot1.png")
hist(spc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

