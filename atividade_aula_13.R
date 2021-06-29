library(drc)
library(plotly)
library(tidyverse)
library(zoo)

url = 'https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv' 
covidBR = read.csv2(url, encoding='latin1', sep = ',') 

covidBR$date <- as.Date(covidBR$date, format = "%Y-%m-%d") 
str(covidBR)

covidBR$dia <- seq(1:length(covidBR$date)) 

predDia = data.frame(dia = covidBR$dia) 
predSeq = data.frame(dia = seq(max(covidBR$dia)+1, max(covidBR$dia)+180))

predDia <- rbind(predDia, predSeq)

fitLL <- drm(vaccinated ~ dia, fct = LL2.5(),
             data = covidBR, robust = 'mean')

predLL <- data.frame(predicao = ceiling(predict(fitLL, predDia))) 
predLL$data <- seq.Date(as.Date('2020-03-12'), by = 'day', length.out = length(predDia$dia)) 

predLL <- merge(predLL, covidBR, by.x ='data', by.y = 'date', all.x = T) 


plot_ly(predLL) %>% 
  add_trace(x = ~data, y = ~predicao, type = 'scatter', mode = 'lines', name = "Vaccinated - Predição") %>% 
  add_trace(x = ~data, y = ~vaccinated, name = "Vaccinated - Observados", mode = 'lines') %>% 
  layout(
    title = 'Predição de vacinados no Brasil contra COVID-19', 
    xaxis = list(title = '', showgrid = FALSE), 
    yaxis = list(title = 'Vacinados por Dia', showgrid = FALSE),
    hovermode = "compare")


covidBR <- covidBR %>% mutate(vacciantedMM7 = round(rollmean(x = vaccinated, 7, align = "right", fill = NA), 2))

covidBR <- covidBR %>% mutate(vaccinatedL7 = dplyr::lag(vaccinated, 7)) 

plot_ly(covidBR) %>% 
  add_trace(x = ~date, y = ~vaccinated, type = 'scatter', mode = 'lines', name = "vacinados") %>% 
  add_trace(x = ~date, y = ~vaccinatedMM7, name = "Vacinadoss", mode = 'lines') %>% 
  layout(title = "vacinados COVID19 no Brasil", 
         xaxis = list(title = '', showgrid = FALSE), 
         yaxis = list(title = 'vacinados por Dia', showgrid = FALSE),
         hovermode = "compare")


############
#anotacoes

data_date <- seq(as.Date("1998-04-12 05:30"), as.Date("2021-04-12 00:00"), 
                 by = "day")
str(data_date)

data_xct <- seq(as.POSIXct("1998-04-12 05:30"), as.POSIXct("2021-04-12 00:00"), 
                by = "month")

str(data_xct)

data_xlt <- seq(as.POSIXlt("1998-04-12 05:30"), as.POSIXlt("2021-04-12 00:00"), 
                by = "hour")

str(data_xlt)


wday(data_xct, label = T, abbr = T)

data_xlt + minutes(60)

year(data_date)
