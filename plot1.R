##Read in data and convert to data frame

library(data.table)
hpc <- fread("household_power_consumption.txt", header = TRUE,
             nrows = 100000, na.strings = c("?"))
hpcdf <- as.data.frame(hpc)

##subset out the relevant date ranges
hpcdf_proj1 <- hpcdf[hpcdf$Date=="1/2/2007",]
hpcdf_proj2 <- hpcdf[hpcdf$Date=="2/2/2007",]
hpcdf_proj3 <- rbind(hpcdf_proj1, hpcdf_proj2)

##reduce the dataset to the relevant variable, and change class to numeric
hpcdf_proj4 <- subset(hpcdf_proj3, select = c("Global_active_power"))
hpcdf_proj4[,"Global_active_power"] <- as.numeric(
    hpcdf_proj4[,"Global_active_power"])

##create png file and plot histogram

png('plot1.png')
hist(hpcdf_proj4$Global_active_power, col = "orangered2",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
