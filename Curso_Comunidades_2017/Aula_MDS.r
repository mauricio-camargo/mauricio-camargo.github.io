#Milagre
library(vegan)
data(dune) #Dados de exemplos do R
plot(metaMDS(dune),type='t')

#Abir dados
library(readxl)
dados=read_excel('estuario.xlsx',2)
fat=dados[,1:2]
fat
abiot=dados[,3:13]
biot=dados[,14:length(dados)]

library(vegan)
mds.abiot <- metaMDS(abiot,distance = "euclidean",autotransform=F) 
mds.abiot$stress #Para ver o stress

#Gr�fico com pontos com 4 simbolos e 2 cores
plot(mds.abiot,type="n",axes=F)
box()
points(mds.abiot$p,pch=c(21,22,23,24)[factor(fat$campanha)],
       bg=c("red","blue")[factor(fat$perfil)],cex=1.2)
legend('topleft',legend=c('V','O','I','P'),pch=c(15,16,17,18),cex=1.4)
legend('bottomright',legend=c('Polu�do','Controle'),pch=16,col=c('red','blue'),cex=1.4)
text(60,-83,'Stress=0,1')

#Gr�fico com pontos com 2 simbolos e 2 nomes dentro deles
plot(mds.abiot,type="n",axes=F,xlab='Eixo 1',ylab='Eixo 2')
box()
points(mds.abiot$p,pch=22,bg=c('blue','red')[fat$perfil],cex=3)
text(mds.abiot$p,labels=fat$campanha)
legend('topleft',legend=c('Polu�do','Controle'),
       pch=15,col=c('red','blue'),cex=1.4)
text(61,-82,'Stress=0,1')

#Pirotecnia
ordihull(mds.abiot,fat$perfil, col = "black")
ordiellipse(mds.abiot, fat$perfil, col = 3, lwd = 1)
ordispider(mds.abiot, fat$perfil, col = "yellow")

#Bubbles
plot(mds.abiot,type="n",axes=F,xlab='Eixo 1',ylab='Eixo 2')
box()
points(mds.abiot$p,pch=21,bg=c('blue','red')[fat$perfil],
       cex=sqrt(abiot$Sulfato))
text(mds.abiot$p,labels=fat$campanha)
ordisurf(mds.abiot,abiot$Sulfato,add=TRUE,
         family =gaussian,labcex=1.2)

#MDS Bi�ticos
mds.bio <- metaMDS(biot,distance="bray",autotransform=F)
mds.bio$stress #Para ver o stress

#Gr�fico com pontos com 4 simbolos e 2 cores
plot(mds.bio,type="n",axes=F)
box()
points(mds.bio$p,,pch=c(21,22,23,24)[factor(fat$campanha)],
       bg=c("red","blue")[factor(fat$perfil)],cex=2)
legend('topleft',legend=c('V','O','I','P'),pch=c(15,16,17,18),cex=1.4)
legend('bottomright',legend=c('Polu�do','Controle'),pch=16,col=c('red','blue'),cex=1.4)
text(-.87,-.88,'Stress=0,1')

#ANOSIM
ano.bio <- anosim(biot,fat$perfil,distance="bray")
summary(ano.bio)
hist(ano.bio$perm,xlab="Estat�stica R",xlim=c(-0.2,0.4))
segments(ano.bio$statistic,-10,ano.bio$statistic,200,lty=2)
text(0.18,150,'R observado')

ano.abio <- anosim(abiot,fat$campanha,distance="bray")
summary(ano.abio)
hist(ano.abio$perm,xlab="Estat�stica R",xlim=c(-0.2,0.4))
segments(ano.abio$statistic,-10,ano.abio$statistic,200,lty=2)
text(0.33,150,'R observado')

#bio-env
names(abiot)
sol <- bioenv(biot ~ Temperat+pH+OD+Salinida+Turbidez, data=abiot)
sol
summary(sol)
