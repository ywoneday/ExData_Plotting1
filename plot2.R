
library(data.table)
zipfilename = "house_power.zip"
txtfilename = "household_power_consumption.txt"

#download the data file from internet
if (!file.exists(txtfilename)) {
	download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile=zipfilename, method="curl")
	unzip(zipfilename)
}

#read the date into the date.table format
dt <- fread(txtfilename,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

#extract the date by subet
subdt <- subset(dt, Date %in% c("1/2/2007","2/2/2007"))

#create R time format column from the Date and the Time column by strptime
subdt[,DateTime:=strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")]

#draw to the png file
png("plot2.png", width=480, height=480)
at=subdt[c(1,1441,2880),DateTime]
with(subdt,plot(x=DateTime,y=Global_active_power,type="l",xlab="", ylab="Global Acitve Power (kilowatts)",xaxt = "n"))
axis(1, at=at, labels=c("Thu","Fri","Sat"))
 
dev.off()

