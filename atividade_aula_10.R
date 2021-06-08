library(data.table)
library(tidyverse)
library(dplyr)
library(validate)
library(funModeling)
library(forcats)

DadosG <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv")

AL <- c("Argentina", "Brazil", "Bolivia", "Chile",
        "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador",
        "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua",
        "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela")

view(DadosG)

Asia <- DadosG[ ,1:30]

AsiaR <- unlist(lapply(DadosG, is.factor))

AsiaR <- Asia[ ,AsiaR]

AsiaW <- acm.disjonctif(AsiaR)

######

fct_count(Asia$new_cases)

fct_lump(Asia$new_cases, n = 2)

#####

AsiaNew <- Asia %>% 
  setDT()

AsiaNew[ ,lm(formula = hdi ~ new_cases + new_deaths + new_cases_per_million + total_cases + total_deaths)]

####

AsiaNew %>% 
  filter(new_cases == "Novos Casos") %>% 
  rename(new_cases = Novos_Casos) %>% 
  group_by(new_cases) %>% 
  summarize(media_f = mean(new_deaths), media_m = mean(new_deats))
