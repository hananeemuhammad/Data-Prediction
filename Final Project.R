setwd("C:\\Users\\VIVOBOOK\\Documents\\Semester 2/Fundamental Data Science")
read.csv("Information of road fatalities 2011-2014.csv") -> d
str(d)
library(tidyr)
d <- separate(d,col = "DeadDate",c("Day","Month","Year"),sep ='/')
d <- unite(d,"Date",c("Year","Month","Day"),sep ='')
d$Date <- as.integer(d$Date)
View(d$Date)
d$male <- ifelse(d$Sex==1,1,0)
d$female <- ifelse(d$Sex==2,1,0)
d$nk <- ifelse(d$Sex==3,1,0)
d2 <- subset(d , select = c(Date,male,female,nk))
write.csv(d2, file = "RoadInc.csv")
##########
write.csv(d,file="dead_accident")

setwd("C:\\Users\\VIVOBOOK\\Documents\\Semester 2/Fundamental Data Science")
read.csv("RoadInc.csv") -> data
str(data)
summary(data)
table(data$male)
table(data$female)
