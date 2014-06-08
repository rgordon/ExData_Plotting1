source(file="LoadAndPrepInput.R")

png(filename="plot3.png",width=480,height=480)

with(hpc, plot(x=DateTime, y=Sub_metering_1,type="l",xlab="", ylab="Energy sub metering"))
with(hpc, lines(x=DateTime,y=Sub_metering_2,col="red"))
with(hpc, lines(x=DateTime,y=Sub_metering_3,type="l",col="blue"))
with(hpc, legend("topright", 
                 legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                 col=c("black","red","blue"), lty=1 ))

dev.off()
