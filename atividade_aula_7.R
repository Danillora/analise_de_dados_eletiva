library(data.table)
library(ff)

enderecobase <- 'bases_originais/largeData.csv'

casos= 1e7

baseLargeData = data.table(a= rbinom (casos, 7, 0.7), 
                           b= rnbinom(casos, 2, 0.7),
                           c= rpois (casos, 5),
                           d= rnorm (casos),
                           e= sample(c("DepFed","Gov","Pref","Pres"), casos, replace=TRUE),
                           f= rpois(casos, 3),
                           g= rnorm(casos))

object.size(baseLargeData)

write.table(baseLargeData,"bases_originais/largeData.csv",sep=",",row.names=FALSE,quote=FALSE)

Amostra <- sapply(baseLargeData, class)

system.time(baseLargeDataA <- data.frame(read.csv2("bases_originais/largeData.csv", colClasses = Amostra)))

system.time(extrac <- read.csv.ffdf(file=enderecobase))

#operação estatistica
mean(extrac[,1])

median(extrac[,3])

#operação matemática
sum(extrac[,5]) 

#regressão linear
lm(c ~ ., extracAmostra)