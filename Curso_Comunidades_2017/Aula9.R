library(readxl)
#Abrir o arquivo Excel usando File>Import Dataset>From Excel
#Armazene a planilha no objeto tab1
tab1=read_excel('Planilhas_PCA.xls',1)
tab1 <- read_excel("Planilhas_PCA.xlsx")

tab1=data.frame(tab1,row.names = 1)
edit(tab1)

##Realizando PCA
tab1.pca=prcomp(tab1)
#Gerando o grafico
biplot(tab1.pca)
#Padronizar (escalonar) os dados
tab1.pca.p=prcomp(tab1,scale=T)
biplot(tab1.pca.p)
#Gerar um grafico ajustado
biplot(tab1.pca.p,xlim=c(-0.6,0.8))
#Deixar o grafico bonitinho
biplot(tab1.pca.p,
       xlim=c(-0.6,0.8),
       col=c('red','blue'),
       main='PCA fajuto',
       xlab='Componente 1 (65,1%)',
       ylab='Componente 2 (25,3%)')
#Incluir linha verticais e horizontais
abline(v=0,lty=2)
abline(h=0,lty=2)
#RESULTADOS DO PCA
summary(tab1.pca.p)

#Exemplo 2
tab2=read_excel('Planilhas_PCA.xlsx',2)
tab2=data.frame(tab2,row.names = 1)
edit(tab2)
tab2.pca=prcomp(tab2,scale=T)
biplot(tab2.pca)
summary(tab2.pca)
tab2.pca
names(tab2)
#Pode-se escolher quais variáveis usar.
#Repare que o lado esquerdo da fórmula fica
#vazio, indicando que nenhuma variável é
#dependente.
tab2.pca=prcomp(~ log(COPPER)+COBALT+
                  sqrt(ZINC)+LEAD,
                data=tab2,
                scale=T)
biplot(tab2.pca)

tab3=read_excel('Planilhas_PCA.xlsx',3)
tab3=data.frame(tab3,row.names = 1)
edit(tab3)

tab3.pca=prcomp(tab3,scale=T)
biplot(tab3.pca)
tab3.pca
tab3.pca=prcomp(~ NO3+NO2+log(Sal), 
                data=tab3, scale=T)
biplot(tab3.pca)

#Sugestões de pacotes para trabalhar com
#graficos do PCA:
#  - vegan
#  - bpc
#  - ggbiplot

library(vegan)
tab1
tab1.rda=rda(tab1,scale=T)
plot(tab1.rda)

library(bpca)
bp=bpca(tab1,scale=T)
plot(bp)

library(ggbiplot)
gg=ggbiplot(tab1.pca.p)
plot(gg)
