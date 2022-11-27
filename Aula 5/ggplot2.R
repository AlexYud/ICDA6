# Referência utilizada: https://ggplot2.tidyverse.org/reference/

library(tidyverse)
library(cowplot)

View(SINASC_2020_compilado)

test <- municipios %>% inner_join(SINASC_2020_compilado, by = c("CODMUNIC" = "CODMUNNASC"))

test %>% select(CODMUNIC, uf_code, IDADEMAE, CONSULTAS, SEXO, PESO, IDANOMAL, SEMAGESTAC, KOTELCHUCK)

test %>% filter(IDADEMAE < 18) %>% group_by(MUNICIPIO) %>% count(sort = TRUE, uf)

hist(test)

ggplot(test, aes(x=test$IDADEMAE)) + geom_dotplot()

ggplot(test, aes(x=test$IDADEMAE)) + geom_map()

test2 <- test %>% select(CODMUNNASC) %>% group_by(CODMUNNASC) %>% count()

boxplot(test2)

test %>% filter(PESO > 5000) %>% group_by(MUNICIPIO) %>% count(sort = TRUE, uf)

boxplot(test)

ggplot(test, aes(x=test$PESO)) + geom_bar()

ggplot(test, aes(x=test$PESO)) + geom_density()
