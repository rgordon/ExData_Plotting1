source(file="LoadAndPrepInput.R")

png(filename="plot4.png",width=480,height=480)
#par(mfrow=c(1,1))
par(mfrow=c(2,2))
# TODO make a function to factor out out the common elements here
# but I'd have to have a way to optionally invoke the ETL for each one

#for now just copy from previous graphs, global active power
# note this one is subtly different on the ylabel - no units declared now
with(hpc, plot(x=DateTime, y=Global_active_power,type="l",xlab="", ylab="Global Active Power"))

# second graph also uses a simple xlabel, make sure its there
with(hpc, plot(x=DateTime, y=Voltage,type="l",xlab="datetime", ylab="Voltage"))

#third graph is just sub-metering again (but no box around the legend)
with(hpc, plot(x=DateTime, y=Sub_metering_1,type="l",xlab="", ylab="Energy sub metering"))
with(hpc, lines(x=DateTime,y=Sub_metering_2,col="red"))
with(hpc, lines(x=DateTime,y=Sub_metering_3,col="blue"))
with(hpc, legend("topright", bty="n",
                 legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                 col=c("black","red","blue"), lty=1 ))

# last graph is reactive-power version of the first graph,different labeling again
with(hpc, plot(x=DateTime, y=Global_reactive_power,type="l",xlab="datetime"))


dev.off()
