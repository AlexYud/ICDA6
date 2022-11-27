# Referência utilizada: https://www.r-bloggers.com/2021/04/naive-bayes-classification-in-r/

library(tidyverse)
library(dplyr)
library(caret)
library(psych)
library(naivebayes)
library(ggplot2)
library(pROC)

str(SINASC_2020_compilado)

sinasc<-SINASC_2020_compilado %>%
  mutate_at(c(1,2,3,4,5),funs(as.factor))

#Analise exploratória
summary(sinasc)

#Ou usar:
#sinasc$target<-as.factor(sinasc$target)


#sinasc<-sinasc[,-c(7,12,13)]


ggplot(sinasc,aes(SEXO,RACACOR,color=RACACOR))+
  geom_jitter()

ggplot(sinasc,aes(SEXO,fill= RACACOR))+
  geom_bar(stat = "count",position = "dodge")

ggplot(sinasc, aes(SEXO,fill=RACACOR))+
  geom_density(alpha=.5)

#pairs.panels(sinasc[,-5])

#Data partition
set.seed(1000)
index<-createDataPartition(sinasc$RACACOR, p=.8,list=FALSE)
sinasc_train<-sinasc[index,]
sinasc_test<-sinasc[-index,]
rm(index)

modelnv<-naive_bayes(RACACOR~.,data=sinasc_train)
modelnv

attributes(modelnv)

#avaliação
pred<-predict(modelnv,sinasc_train)
confusionMatrix(pred,sinasc_train$RACACOR)

print(prop.table(table(sinasc_train$RACACOR)),digits = 2)

#calibrar modelo
modelnv1<-naive_bayes(RACACOR~.,data=sinasc_train,
                      usekernel = TRUE)
pred<-predict(modelnv1,sinasc_test)
confusionMatrix(pred,sinasc_test$RACACOR)

modelnv2<-train(RACACOR~., data=sinasc_train,
                method="naive_bayes",
                preProc=c("center","scale"))

pred<-predict(modelnv2,siansc_test)
confusionMatrix(pred,sinasc_test$RACACOR)

#Montando a curva ROC
pred_sinasc<-predict(modelnv2,sinasc_test, type = "prob")[, 2]
heart_roc<-roc(sinasc_test$RACACOR ~ pred_sinasc, plot = TRUE, print.auc = TRUE)
