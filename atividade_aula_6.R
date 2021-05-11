###Atividade Análise de Dados - PPGCP - 2021

install.packages("rvest")
library(rvest)

install.packages("dplyr")
library(dplyr)

install.packages("tidyverse")
library(tidyverse)

#Extração de arquivos

VacRec <- read.csv2('http://dados.recife.pe.gov.br/dataset/f381d9ea-4839-44a6-b4fe-788239189900/resource/966e9c4c-df45-40d7-9c58-2f13c61a6d28/download/vacinados.csv', sep = ';', encoding = 'UTF-8')

#Extração com WebScraping
#com tidyverse

url <- "https://pt.wikipedia.org/wiki/Campeonato_Pernambucano_de_Futebol"

urlTables <- url %>% read_html %>% html_nodes("table")

urlLinks <- url %>% read_html %>% html_nodes("link")

TitulosPorEquipe <- as.data.frame(html_table(urlTables[8]))

View(TitulosPorEquipe)

#resultado Premiere League 

ResultsPL <- read_html("https://globoesporte.globo.com/futebol/futebol-internacional/futebol-ingles/")

ResultsPL <- ResultsPL %>% html_nodes(".swiper-slider")

rodada <- ResultsPL %>% html_nodes(".aside-header .text-center")

resultados <- ResultsPL %>% html_nodes(".aside-contet .clearfix")

mandante <- resultados %>% html_nodes(".pull-left .time-sigla") %>% html_text ()

visitante <- resultados %>% html_nodes(".pull-right .time-sigla") %>% html_text()

TabelaPL <- data.frame(
  mandante = mandante,
  visitante = visitante)

View(TabelaPL)

#carga incremental

#carregar base de dados original

DespesasOrc <- read.csv2('http://dados.recife.pe.gov.br/dataset/4e008cec-c6a8-40cf-8fc7-d1530168b816/resource/df6d4a2a-7f78-4f98-a38b-8cf74b7823d7/download/recife-dados-despesas-2021.csv', sep = ';', encoding = 'UTF-8')

DespesasOrc2 <- read.csv2('http://dados.recife.pe.gov.br/dataset/4e008cec-c6a8-40cf-8fc7-d1530168b816/resource/df6d4a2a-7f78-4f98-a38b-8cf74b7823d7/download/recife-dados-despesas-2021.csv', sep = ';', encoding = 'UTF-8')

DespesasOrcNew <- (!DespesasOrc2$orgao_nome %in%
                     DespesasOrc)

DespesasOrc$chaveSubstituta = apply(DespesasOrc[, c(1,2,4,5)], MARGIN = 1,
                                    FUN = function(i) paste(i, collapse = ""))

DespesasOrcFull <- (!DespesasOrcNew$chaveSubstituta %in%
                      DespesasOrc$chaveSubstituta)