# Referência utilizada: http://leg.ufpr.br/~walmes/cursoR/data-vis/slides/05-dplyr.pdf

library(tidyverse)
library(cowplot)

View(SINASC_2020_compilado)

test <- municipios %>% inner_join(SINASC_2020_compilado, by = c("CODMUNIC" = "CODMUNNASC"))

test %>% select(CODMUNIC, uf_code, IDADEMAE, CONSULTAS, SEXO, PESO, IDANOMAL, SEMAGESTAC, KOTELCHUCK)

test %>% filter(IDADEMAE < 18) %>% group_by(MUNICIPIO) %>% count(sort = TRUE, uf)

hist(test)


test %>% filter(PESO > 5000) %>% group_by(MUNICIPIO) %>% count(sort = TRUE, uf)

boxplot(test)

ggplot(test, aes(x=test$PESO)) + geom_bar()
