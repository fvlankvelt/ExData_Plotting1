Sys.setlocale("LC_TIME", "en_US.UTF-8")

pc <- read.csv('household_power_consumption.txt', sep=';', colClasses="character")
spc <- subset(pc, pc$Date == "1/2/2007" | pc$Date == "2/2/2007")

spc$Global_active_power <- as.numeric(spc$Global_active_power)
spc$time <- strptime(paste(spc$Date, spc$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png")
plot(spc$time, spc$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()
