library(readxl)

dados=read_excel('estuario.xlsx')
fat=dados[,1:3]
View(fat)
abiot=dados[,4:11]
View(abiot)
biot=dados[,12:length(dados)]
View(biot)

dim(abiot)
dim(biot)
dim(fat)

#Matriz de dist�ncia abi�tico modo Q 
#(dist�ncia euclideana)
dist_abiot_Q = dist(abiot,method='euclidean')
dist_abiot_Q #Matriz de dist�ncia

clust_abiot_Q=
  hclust(dist_abiot_Q,)
plot(clust_abiot_Q)
#Melhorando o gr�fico
plot(clust_abiot_Q,hang=-1,
     labels=factor(fat$Label))
abline(h=8)#N�vel de corte

#Destacando os grupos
rect.hclust(clust_abiot_Q,8)
#Mudando as cores dos grupos
rect.hclust(clust_abiot_Q,4,border=c('blue','blue','green','black'))
legend('topright',c('Mesohalino','Euhalino','Oligohalino'),
       pch=c(15,15,15),col=c('blue','green','black'))

#Calculando a matriz de correlação cofenética
dist_coph_abiot_Q=cophenetic(clust_abiot_Q)
#Calculando a correlação cofenética
cor(dist_abiot_Q,dist_coph_abiot_Q)

#Cluster abiótico modo R (basta transpor a matriz)
dist_abiot_R=dist(t(abiot),method='euclidean')

#Realizando um cluster
clust_abiot_R=hclust(dist_abiot_R)
plot(clust_abiot_R)
#Melhorando o gráfico
plot(clust_abiot_R,hang=-1,
     ylab='Distância euclideana',xlab='',main='',sub='')
#Calculando a matriz de correlação cofenética
dist_coph_abiot_R=cophenetic(clust_abiot_R)
#Calculando a correlação cofenética
cor(dist_abiot_R,dist_coph_abiot_R)

#Modo Q e modo R ao mesmo tempo (análise nodal)
heatmap(as.matrix(abiot),
        labRow=fat$Label)

#Cluster dos dados bióticos
#O pacote vegan (vegetation analysis) realiza uma série de análises multivariadas e calcula muitos índices
#Para carregar um pacote, use library()
library(vegan)
?vegdist

#Calcular matriz de similaridade de Bray-Curtis
dist_biot_Q=vegdist(biot,"bray")
dist_biot_Q

#Realizando um cluster modo Q
clust_biot_Q=hclust(dist_biot_Q)

plot(clust_biot_Q)
#Melhorando o gráfico
plot(clust_biot_Q,hang=-1,labels=fat$Label,
     ylab='Bray-Curtis',xlab='',main='',sub='')
#Destacando os grupos
rect.hclust(clust_biot_Q,2,border=c('blue','red'))

#Calculando a matriz de correlação cofenética
dist_coph_b<-cophenetic(clust_biot_Q)
#Calculando a correlação cofenética
cor(dist_biot_Q,dist_coph_b)

#Realizando um cluster modo R
#Calcular matriz de similaridade de Bray-Curtis
dist_biot_R=vegdist(t(biot),"bray")
dist_biot_R

clust_biot_R<-hclust(dist_biot_R)
plot(clust_biot_R)
#Melhorando o gráfico
plot(clust_biot_R,hang=-1,
     ylab='Bray-Curtis',xlab='',main='',sub='')

#Calculando a matriz de correlação cofenética
dist_coph_b<-cophenetic(clust_biot_R)
#Calculando a correlação cofenética
cor(dist_biot_R,dist_coph_b)

#Modo Q e modo R ao mesmo tempo (análise nodal)
heatmap(as.matrix(biot),labRow=fat$Label)

