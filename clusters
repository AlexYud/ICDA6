library(cluster)
library(factoextra)
library(dplyr)

sinasc <- SINASC_2020_compilado%>%
  slice_head(n = 10) %>% select(-ORIGEM)

arrest <- scale(sinasc)
arrest.dist <- get_dist(arrest, method = "pearson")
head(round(as.matrix(arrest.dist), 2))[, 1:10]

# Visualizar a matriz de dissimilaridade
fviz_dist(arrest.dist, lab_size = 8)
ar.dist <- dist(arrest, method = "euclidean")
fviz_dist(ar.dist, lab_size = 8)
fviz_nbclust(arrest, kmeans, method = "gap_stat", k.max = 8)

set.seed(123)
km.res <- kmeans(arrest, 3, nstart = 25)
#km.res <- eclust(arrest, "kmeans", nstart = 25)
#fviz_gap_stat(km.res$gap_stat)
# Visualizar
fviz_cluster(km.res, data = arrest, palette = "jco",
             ggtheme = theme_minimal())


#Silhouette
fviz_silhouette(km.res)
km.res$nbclust

fviz_silhouette(res.hc)
res.hc$nbclust
fviz_dend(res.hc, rect = TRUE)
fviz_cluster(res.hc)
