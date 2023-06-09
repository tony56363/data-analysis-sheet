# read the csv file 
data <- read.csv("G2_anthropometry.csv")

# read the first 5 rows
head(data,5)

# read the last 5 rows
tail(data,5)

# check if null value in data
sum(is.na(data))

data$age <- as.character(data$age)

data$height <- gsub("//$", '', data$height)

library(mice)

Pre.imputation <- mice(data, m=5, method = c("", "pmm", "logreg", "pmm"), maxit = 20)
Pre.imputation$imp
mynewdata <- complete(Pre.imputation, 5)
mynewdata

################### visulize scatter plot between Age and Height
library(ggplot2)


draw_sc <- ggplot(data, aes(age, height))
draw_sc + geom_point(aes(color=Region)) + labs(x="Age", y="Height")
draw_sc + geom_point(aes(color=Region)) + stat_smooth(se=FALSE)
draw_sc + geom_point(aes(color=Region)) + stat_smooth(se=FALSE)


################### visulize scatter plot between Age and foot_leng

draw_sc <- ggplot(data, aes(age, height))
draw_sc + geom_point(aes(color=Region)) + labs(x="Age", y="foot_leng")
draw_sc + geom_point(aes(color=Region)) + stat_smooth(se=FALSE)
draw_sc + geom_point(aes(color=Region)) + stat_smooth(se=FALSE)