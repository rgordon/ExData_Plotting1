source(file="LoadAndPrepInput.R")

png(filename="plot1.png",width=480,height=480)
hist(hpc$Global_active_power,xlab="Global Active Power (kilowatts)", ylim=c(0,1200), col="red",
     main='Global Active Power')
dev.off()
