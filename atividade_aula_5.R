####Atividade Aula 5 - Análise de Dados Eletiva - PPGCP 2021.1####

#Extração, Tratamento e Leitura (ETL)

#carregando as bases de dados de Sinistro de Transito pelo site da Prefeitura da Cidade do Recife
library(dplyr)

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

###Juntando as bases de dados###

sinistrosRecifeRawFull <- rbind(sinistrosRecife2020Raw, sinistrosRecife2021Raw)

sinistrosRecife2019Raw <- sinistrosRecife2019Raw[  , -c(10, 11, 12)]

names(sinistrosRecife2019Raw)[1] <- "data"

sinistrosRecifeRawFull2 <- rbind(sinistrosRecife2019Raw, sinistrosRecifeRawFull)

sinistrosRecifeRawFull2$sentido_via <- as.factor(sinistrosRecifeRawFull2$sentido_via)

naZero <- function(x) {  x <- ifelse(is.na(x), 0, x)}

str(sinistrosRecifeRawFull2)

### Modificando a data
sinistrosRecifeRawFull2$data <- as.Date(sinistrosRecifeRawFull2$data, format = "%Y-%m-%d")

### Staging area, qual ocupa mais espaço

for (item in ls()) { 
  print(formatC(c(item, object.size(get(item))), 
                format="d", 
                width=30), 
        quote=F)
}

### Limpando o lixo

rm(list = c('sinistrosRecife2020Raw', 'sinistrosRecife2021Raw', 'sinistrosRecifeRawFull', 'sinistrosRecife2019RawFull2'))

ls()


#microbanchmarking

install.packages("microbenchmark")
library(microbenchmark)

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')


# exporta formato nativo R
saveRDS(sinistrosRecifeRawFull2, "bases_tratadas/sinistrosRecife.rds")

# exporta formato tabular .csv
write.csv2(sinistrosRecifeRawFull2, "bases_tratadas/sinistrosRecife.csv")

# exporta formato de texto .txt
write.table(sinistrosRecifeRawFull2, "bases_tratadas/sinistrosRecife.txt")