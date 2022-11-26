# Referência utilizada: https://www.magazineluiza.com.br/portaldalu/peso-ideal-e-bebe-equilibrado/7318/#:~:text=O%20peso%20ideal%20de%20uma,kg%20a%203%2C5%20kg.

library(tidyverse)
library(cowplot)

View(SINASC_2020_compilado)

sinasc <- SINASC_2020_compilado%>%
  slice_head(n = 50000)

idade <- sinasc %>% filter(IDADEMAE < 18) %>% count() 
idade 

# Das 50 mil maes, 5402 são menores de idade

peso <- sinasc %>% filter(PESO < 3000) %>% count() 
peso 

# Dos 50 mil bebes, 14695 estão abaixo do peso considerado normal

peso <- sinasc %>% filter(PESO > 3500) %>% count() 
peso 

# Dos 50 mil bebes, 14732 estão acima do peso considerado normal
