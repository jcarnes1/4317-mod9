install.packages("ggplot2")
install.packages("reshape2")
library(ggplot2)
library(reshape2)
#load csv file
weightLoss <- read.csv('WeightLoss.csv', stringsAsFactors = FALSE)
#make 3 lines
ggplot(weightLoss, aes(X, wl1)) + geom_line(color = "red") + geom_point()
ggplot(weightLoss, aes(X, wl2)) + geom_line(color = "green") + geom_point()
ggplot(weightLoss, aes(X, wl3)) + geom_line(color = "blue") + geom_point()
#condense data
weightLoss$se1 = NULL
weightLoss$se2 = NULL
weightLoss$se3 = NULL
weightLoss$group = NULL
#melt data together
melted_weightLoss <- melt(weightLoss, id = "X")
#plot 3 graphs together
ggplot(melted_weightLoss, aes(x = X, y = value, group = variable, color = variable)) + geom_line() + geom_point()
