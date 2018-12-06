library(readxl)
dados=read_excel('Distancias Cidades.xls',)
fat=read_excel('Distancias Cidades.xls',2)
dados=dados[,2:length(dados)]
#edit(dados)


library(vegan)
m<-metaMDS(dados,distance='euclidean',autotransform=F)
plot(m$p)
x<-m$p[,1]
y<-m$p[,2]
plot(x,y,type='n')
text(x,y,fat$estado,cex=0.8)
#Invertendo as polaridades
plot(-x,-y,type='n')
text(-x,-y,fat$estado,cex=0.8)
#Entre as regiões
plot(-x,-y,type='n')
text(-x,-y,fat$região,cex=0.8)

cl<-hclust(dist(dados,method="man"))
plot(cl,hang=-1,,labels=fat$estado) #Estados
plot(cl,hang=-1,,labels=fat$região) #Regiões
rect.hclust(cl,3)
