library(data.table)
library(funModeling)
library(tidyverse)
library(plotly)


DadosG <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv")

BaseNmortos <- DadosG$new_deaths

status(BaseNmortos)

NewBase <- as.data.frame(abs(is.na(BaseNmortos)))

head(NewBase)

ReNewBase <- NewBase[which(sapply(x, sd) > 0)]

cor(ReNewBase)

View(ReNewBase)

##
plot_ly(y = DadosG$new_cases, type = "box", text = DadosG$new_deaths, boxpoint = "all", jitter = 0.3)

boxplot.stats(DadosG$new_cases)$out
boxplot.stats(DadosG$new_cases, coef = 2)$out


##

DadosG$new_cases <- impute(DadosG$new_cases, fun = mean)

(DadosG$new_cases <- round(runif(10, 1, 50)))

(DadosG$new_cases[DadosGNASeed] <- NA)

