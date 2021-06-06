library(data.table)
library(tidyverse)
library(dplyr)
library(validate)
library(funModeling)

general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv")

glimpse(general_data)
status(general_data)
freq(general_data)
plot_num(general_data)
profiling_num(general_data)

AL <- c("Argentina", "Brazil", "Bolivia", "Chile",
        "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador",
        "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua",
        "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela")

AL <- general_data %>% filter(location %in% AL)

MAL <- AL %>% group_by(location) %>% mutate(row = row_number()) %>% select(location, new_cases, row)

view(MAL)
view(AL)

result <- MAL %>% group_by(location) %>% filter(row == max(row))
MAL <- MAL %>% filter(row<=min(result$row))

MAL2 <- MAL %>% pivot_wider(names_from = row, values_from = new_cases) %>% remove_rownames %>% column_to_rownames(var = "location")

AL %>% filter(new_cases>=0)

AL <- drop_na(AL, new_deaths)

validacao <- validator(new_deaths != is.na(new_deaths), new_cases != is.na(new_cases))

plot(validacao)


