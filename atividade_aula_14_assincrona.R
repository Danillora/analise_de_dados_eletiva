library(tidyverse)
library(stringr)
library(zoo)
library(readxl)

BaseCovidPE <- read.csv2("C:/Users/Danielle/Desktop/basegeral.csv")

skimr::skim(BaseCovidPE$dt_primeiros_sintomas)

BaseCovidPE$dt_primeiros_sintomas <- Hmisc::impute(BaseCovidPE$dt_primeiros_sintomas, "random")


Confirmados <- as.data.table(table(BaseCovidPE$classe == "CONFIRMADO", by = BaseCovidPE$municipio)) %>% 
  filter(V2 == T)

Negativos <- as.data.table(table(BaseCovidPE$classe == "NEGATIVO", by = BaseCovidPE$municipio)) %>% 
  filter(V2 == T)

BaseCovidPE2 <- BaseCovidPE %>% mutate(sintomas_tosse = ifelse(grepl(paste("TOSSE", collapse="|"), sintomas), '1', '0'))


ConfirmadosA <- as.data.table(table(BaseCovidPE2$classe == "CONFIRMADO" & BaseCovidPE2$sintomas_tosse == 1, by = BaseCovidPE2$municipio)) %>% 
  filter(V2 == T)

NegativosA <- as.data.table(table(BaseCovidPE2$classe == "NEGATIVO" & BaseCovidPE2$sintomas_tosse == 1, by = BaseCovidPE2$municipio)) %>% 
  filter(V2 == T)



ConfirmadosB <- BaseCovidPE2 %>%
  arrange(as.Date(dt_notificacao)) %>% filter(classe == "CONFIRMADO") %>% 
  mutate(confirmado_m = round(rollmean(x = table(classe), 7, align = "right", fill = NA), 2))


NegativosB <- BaseCovidPE2 %>%
  arrange(as.Date(dt_notificacao)) %>% filter(classe == "NEGATIVO") %>% 
  mutate(negativo_m = round(rollmean(x = table(classe), 7, align = "right", fill = NA), 2))

