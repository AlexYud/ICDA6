library(arules)
library(RColorBrewer)
library(arulesViz)
library(dplyr)
data("SINASC_2020_comp")
str(SINASC_2020_comp)

data <- municipios %>% inner_join(SINASC_2020_comp, by = c("CODMUNIC" = "CODMUNNASC"))

data %>% mutate(total = cumsum(CONSULTAS)) %>% select(CODMUNIC, uf_code, total) %>% slice_max(total, n = 5)

#Remover ou substituir variáveis não utilizadas
test<-data%>%
  filter(!is.na(IDADEMAE))
 # select(-is_capital,-5)

#Converter para categórico
test[[ "IDADEMAE"]] <- ordered(cut(test[[ "IDADEMAE"]], c(12,25,45, 49)),
                           labels = c("jovem", "adulto", "meia-idade"))

test[[ "IDADEMAE"]] # categórico para jovem, adulto e meia-idade

test[["SEXO"]] <- ordered(cut(test[[ "SEXO"]], c(1,2)),
                               labels = c("feminino", "masculino"))

test[["SEXO"]] # categórico para feminino e masculino
