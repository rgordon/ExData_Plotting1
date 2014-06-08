# let's just load and filter what we want out of the table that way
# use source(file="LoadAndPrepInput.R") to execute the above in each plot file
# we expect to be in the code directory, with the data file in the same directory

# should we download the file first? It's pretty dumb if we're doing a bunch of things 
# at once. But the project description does say to allow each one to be executed independently.
# so:
datafile <- "exdata-data-household_power_consumption.zip"
if (! file.exists(datafile)) {
  dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url=dataUrl,destfile=datafile,method="curl")
}

# read data directly from zip file
zipfile <- unz("../exdata-data-household_power_consumption.zip","household_power_consumption.txt")
allhpc <- read.table(zipfile,header=TRUE,sep=';',na.strings='?',stringsAsFactors=FALSE)

#  filter out the date range we want to look at
hpc <- allhpc[allhpc$Date == '1/2/2007' | allhpc$Date == '2/2/2007',]

# free up memory from intermediate tables and connections
allhpc <- NULL
zipfile <- NULL

# cleanup input table: we don't need the rownames, and we do want proper Date
row.names(hpc) <- NULL
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")

