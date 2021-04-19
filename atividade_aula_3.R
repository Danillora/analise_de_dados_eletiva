#Atividade Eletiva Análise de Dados - PPGCP 2021.1
#Atvd Tipos de Objetos

#Criando Dataframe

nome_politico <- c("Madalena", "Emily", "Gilberto", "Marcos")

idade_politico <- c(25, 29, 32, 46)

estado_nascimento <- c("São Paulo", "Minas Gerais", "Pernambuco", "Amazonas")

partido <- c("PT", "PSOL", "PDT", "PSTU")

caracteristicas_politicos <- data.frame(nome_politico, idade_politico,
                                        estado_nascimento, partido)

str(caracteristicas_politicos)
head(caracteristicas_politicos)
tail(caracteristicas_politicos)
View(caracteristicas_politicos)
