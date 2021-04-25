###Atividade aula 4###

#criando variaveis normais

set.seed(10); v_normal1 <- rnorm(500, mean = 5, sd = 2)
set.seed(20); v_normal2 <- rnorm(500, mean = 10, sd = 1)

#criando variavel binominal

set.seed(50); v_binominal <- rbinom(500, 1, 0.8)

#criando variavel binominal negativa

set.seed(40); v_binomineg <- rnbinom(500, 70, prob = 0.8)

#criando variavel poisson

set.seed(30); v_poisson <- rpois(500, 50)

#criando variavel index

v_index <- seq(1, length(v_normal2))

#criando o dataframe com as variaveis anteriores e criando variavel categorica
#baseada na variavel binominal

df <- data.frame(v_normal1, v_normal2, v_index, v_poisson, v_binominal, v_binomineg)

df$ctgbb <- ifelse(df$v_binominal == 0, "zero","um")

#centralizando as variaveis normais

v_normal1_centralizada <- v_normal1 - mean(v_normal1)
v_nomral2_centralizada <- v_normal2 - mean(v_normal2)

#alterando variaveis de contagem

v_poisson_alt <- ifelse(df$v_poisson == 0, 1, v_poisson)

v_binomineg_alt <- ifelse(df$v_binomineg == 0, 1, v_binomineg)

#criando outro dataframe com a

bootstrappingA <- replicate(1, sample(v_normal1, 100, replace = TRUE))

bootstrappingB <- replicate(1, sample(v_normal2, 100, replace = TRUE))

bootstrappingC <- replicate(1, sample(v_poisson, 100, replace = TRUE))

bootstrappingD <- replicate(1, sample(v_binominal, 100, replace = TRUE))

bootstrappingE <- replicate(1, sample(v_binomineg, 100, replace = TRUE))

bootstrappingF <- replicate(1, sample(v_index, 100, replace = TRUE))


df_btstpng <- data.frame(bootstrappingA, bootstrappingB, bootstrappingC, bootstrappingD, bootstrappingE)
