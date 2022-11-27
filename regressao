library(ggplot2)
library(dplyr)
#library(DAAG)

str(SINASC_2020_comp)


#View(SINASC_2020_comp)
ggplot(SINASC_2020_comp, aes(PESO,SEMAGESTAC))+
  geom_point()

set.seed(100)
train_linha_sinasc <- sample(1:nrow(SINASC_2020_comp), 0.8*nrow(SINASC_2020_comp))  # índice da linha dos dados de treinamento
train_dado_sinasc <- cars[train_linha_sinasc, ]  # dados do modelo de treinamento
test_dado_sinasc  <- cars[-train_linha_sinasc, ]

lm_model_sinasc <- lm(SINASC_2020_comp$PESO ~ SINASC_2020_comp$SEMAGESTAC, data=train_dado_sinasc)  # construção do modelo
lm_model_sinasc # reta de regressão

ggplot(SINASC_2020_comp, aes(y = PESO)) +
  geom_boxplot()

ggplot(SINASC_2020_comp, aes(y = SEMAGESTAC)) +
  geom_boxplot()

# distribuição normal
shapiro.test(as.numeric(SINASC_2020_comp$PESO))
shapiro.test(SINASC_2020_comp$SEMAGESTAC)

# correlação
cor(as.numeric(SINASC_2020_comp$PESO),SINASC_2020_comp$SEMAGESTAC)
