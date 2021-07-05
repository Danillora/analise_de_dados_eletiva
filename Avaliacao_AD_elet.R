library(tidyverse)
library(stringr)
library(data.table)
library(lubridate)
library(readxl)

BaseCovidPE <- fread("https://dados.seplag.pe.gov.br/apps/basegeral.csv")
Tabela1 <- read_excel("C:/Users/Danielle/Desktop/tabela6579.xlsx")

Tabela1 <- Tabela1%>%slice(c(-1, -2,-3,-4))

Tabela1$index <- str_detect(Tabela1$`Tabela 6579 - População residente estimada`, "(PE)")
Tabela1 <- Tabela1%>% filter(index==TRUE)

names(Tabela1) <- c("municipio", "população", "index")

Tabela1 <- Tabela1[,-3]
Tabela1$municipio <- str_remove(Tabela1$municipio, ' .(PE.)')
Tabela1$municipio <- toupper(Tabela1$municipio)
Tabela1$população <- as.numeric(Tabela1$população)

Tabela1 <- as.data.table(Tabela1)


BaseCovidPE$semana <- format(floor_date(BaseCovidPE$dt_notificacao, "week"), "%Y-W%W")

BaseCovidPE2 <- fuzzyjoin::stringdist_join(BaseCovidPE, Tabela1, mode='left', by ="municipio")

Geral <-BaseCovidPE2 %>% filter(classe== "CONFIRMADO") %>%
  group_by(municipio.x, semana, população) %>% count(classe) %>% arrange(semana) %>%
  mutate("n/100k" = n/população*100000)


Geral %>% group_by(municipio.x,semana) %>% summarise("incidencia"=sum(n),
     "incidência por 100k"=sum(`n/100k`)) %>% arrange(municipio.x,semana)

Geral2 <- BaseCovidPE2 %>% group_by(municipio.x, semana,população) %>%
  count(dt_obito) %>% na.omit() %>% mutate("n/100k"= n/população*100000)

Geral2 %>% group_by(municipio.x, semana) %>% summarise(letalidade= sum(n),
      "letalidade por 100k"= sum(`n/100k`)) %>% arrange(municipio.x,semana)
