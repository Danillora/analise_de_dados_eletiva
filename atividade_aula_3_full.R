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


#Atvd de Simulações e Sequências


###criando variavéis para distribuição normal###

distrib_normal <- rnorm(180)
#verificando resultado
distrib_normal

###criando variáveis para distribuição binominal###

distrib_binomial <- rbinom(180, 1, 0.7)
#ver resultado
distrib_binomial

###repetições###
ideologia <- c(rep("Esquerda", length(distrib_binomial)/2), rep(
  "Centro Esquerda", length(distrib_binomial)/2)) 
#ver resultado
ideologia

#sequência
index <- seq(1, length(distrib_normal))
#ver resultado
index


###Atividade Amostragem e Bootstrapping###

bootstrapping_dist_norm1 <- replicate(110, sample(distrib_normal, 10, replace = TRUE))

bootstrapping_dist_norm2 <- replicate(125, sample(distrib_normal, 10, replace = TRUE))

bootstrapping_dist_norm3 <- replicate(145, sample(distrib_normal, 10, replace = TRUE))

#ver resultado
bootstrapping_dist_norm1
bootstrapping_dist_norm2
bootstrapping_dist_norm3

###Tirando média e comparando###
mean(bootstrapping_dist_norm1)
mean(bootstrapping_dist_norm2)
mean(bootstrapping_dist_norm3)
mean(distrib_normal) #média dos dados originais

###Atividade Calculando###

hist(distrib_normal)

distribNormal_central <- distrib_normal - mean(distrib_normal)
#ver resultado
hist(distribNormal_central)

poissonatvd <- rpois(300, 3)
#ver resultado
hist(poissonatvd)

###Atividade Index e Operadores Lógicos###

distrib_normal[110]
distrib_normal[distrib_normal > 2 & distrib_normal < 3]

###Atividade Estruturas de Controle###

caracteristicas_politicos$atvd <- ifelse(caracteristicas_politicos$partido == "PT", 0, 1)
#ver resultado
caracteristicas_politicos$atvd


###Atividade Funções###

GilPol <- function(nro) {
      for(i in 1:nro) {
    cat("O Brasil tá lascado!!\n")
  }
}

GilPol(2)

###Atividade de Funções de Repetição - Família Apply###

par(mfrow = c(2, 2))
sapply(caracteristicas_politicos[ ,2],hist)

