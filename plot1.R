
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

#draw the hist to the png file
png("plot1.png", width=480, height=480)
with(subdt, hist(Global_active_power,col="red", xlab="Global Acitve Power(kilowatts)", main="Global Acitve Power"))
dev.off()

