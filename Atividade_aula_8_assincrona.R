library(ff)
library(ffbase)

SitFinal2011 <- read.csv2.ffdf(file="http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/9a694ab5-99ab-4ff1-ac6b-c97917c6a762/download/situacaofinalalunos2011.csv")
SitFinal2012 <- read.csv2.ffdf(file="http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/f6633c26-be36-4c27-81cb-e77d90316cff/download/situacaofinalalunos2012.csv")
SitFinal2013 <- read.csv2.ffdf(file="http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/95eb9ea8-cd75-4efa-a1ba-ba869f4e92b9/download/situacaofinalalunos2013.csv")
SitFinal2014 <- read.csv2.ffdf(file="http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/0a2aec2f-9634-4408-bbb4-37e1f9c74aa1/download/situacaofinalalunos2014.csv")
SitFinal2015 <- read.csv2.ffdf(file="http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/264f0a37-ad1c-4308-9998-4f0bd3c6561f/download/situacaofinalalunos2015.csv")
SitFinal2016 <- read.csv2.ffdf(file="http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/f42a3c64-b2d7-4e2f-91e5-684dcd0040b9/download/situacaofinalalunos2016.csv")
SitFinal2017 <- read.csv2.ffdf(file="http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/70c4e6fc-91d2-4a73-b27a-0ad6bda1c84d/download/situacaofinalalunos2017.csv")
SitFinal2018 <- read.csv2.ffdf(file="http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/8f3196b8-c21a-4c0d-968f-e2b265be4def/download/situacaofinalalunos2018.csv")
SitFinal2019 <- read.csv2.ffdf(file="http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/3b03a473-8b20-4df4-8628-bec55541789e/download/situacaofinalalunos2019.csv")
SitFinal2020 <- read.csv2.ffdf(file="http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/9dc84eed-acdd-4132-9f1a-a64f7a71b016/download/situacaofinalalunos2020.csv")

SitFinalFull <- ffdfrbind.fill(SitFinal2011, SitFinal2012,SitFinal2013, SitFinal2014,SitFinal2015,
                               SitFinal2016, SitFinal2017,SitFinal2018,SitFinal2019, SitFinal2020)

rm(list=c("SitFinal2011","SitFinal2012","SitFinal2013","SitFinal2014","SitFinal2015",
          "SitFinal2016","SitFinal2017","SitFinal2018","SitFinal2019","SitFinal2020"))

saveRDS(SitFinalFull, "C:/Users/Danielle/Desktop/SitFinalFull.rds")
