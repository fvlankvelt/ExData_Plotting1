Sys.setlocale("LC_TIME", "en_US.UTF-8")

pc <- read.csv('household_power_consumption.txt', sep=';', colClasses="character")
spc <- subset(pc, pc$Date == "1/2/2007" | pc$Date == "2/2/2007")

spc$Sub_metering_1 <- as.numeric(spc$Sub_metering_1)
spc$Sub_metering_2 <- as.numeric(spc$Sub_metering_2)
spc$Sub_metering_3 <- as.numeric(spc$Sub_metering_3)
spc$time <- strptime(paste(spc$Date, spc$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot3.png")
plot(spc$time, spc$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(spc$time, spc$Sub_metering_1, type="l", col="black")
lines(spc$time, spc$Sub_metering_2, type="l", col="red")
lines(spc$time, spc$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)
dev.off()
