library(dplyr)
library(stringr)
library(textreadr)
library(pdftools)
library(fuzzyjoin)

Poli <- c("Downs", "Olson", "Dahl", "Acemoglu", "King")
Leg <- c("Econ Theory Democ", "Collective Action", "Poliarchy","Narrow Corridor", "Designing Social Inquiry")
Age <- c(23, 22, 22, 24, 33)
Area <- c("Political Economy", "Social Groups", "Democracy", "Economy", "Methodology")

PolSciGuys <- data.frame(Poli, Leg, Age, Area)

Name <- c("Anthony Downs", "Mancur Olson", "Robert Dahl", "Daron Acemoglu", "Gary King")
Univ <- c("Stanford", "Havard", "Yale", "MIT", "Havard")

PolSciGuysFull <- data.frame(Name, Univ)

PolSciGuysFullA <- stringdist_join(PolSciGuys, PolSciGuysFull, mode='left')

PolSciGuysB <- PolSciGuysFullA %>% mutate(tag_CP = ifelse(grepl(paste("EmpiricalPolSci", collapse="|"), Univ), '1', '0'))
