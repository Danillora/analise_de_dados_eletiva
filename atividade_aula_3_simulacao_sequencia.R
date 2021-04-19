#Atividade da disciplina eletiva de Análise de Dados
#Atividade de Simulações e Sequências


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

