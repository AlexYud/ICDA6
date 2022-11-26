library(tidyverse)
library(cowplot)

# Comparando a quantidade do número de chaveiros dos shoppings

shop1 <- ggplot(shopping, aes(x=shopping$chaveiro)) + 
  geom_bar() 
  
shop2 <- ggplot(shopping2, aes(x=shopping2$chaveiro)) + 
  geom_bar()

plot_grid(shop1, shop2, labels = "AUTO")

# Resultado: O shopping 1 possui até 6 áreas com 3 chaveiros enquanto o shopping 2 mais de 10 áreas com apenas 1 chaveiro

