source(file="LoadAndPrepInput.R")

png(filename="plot2.png",width=480,height=480)

# determine the weekday for each date, and make Factor for graphic use
hpc$weekday <- weekdays(hpc$DateTime,abbreviate=TRUE)
hpc$weekday <- as.factor(hpc$weekday)

with(hpc, plot(x=DateTime, y=Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()
