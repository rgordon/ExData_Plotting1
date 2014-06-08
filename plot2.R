source(file="LoadAndPrepInput.R")

png(filename="plot2.png",width=480,height=480)

with(hpc, plot(x=DateTime, y=Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()
