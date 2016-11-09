#Gráficos simples
set.seed(21)
v=rnorm(50,12,4)
hist(v)#Função de alto nível
text(locator(1),'Texto')#Função baixo nível

hist(v,ylab='Frequência',
     xlab='Classes',
     main='Meu histograma',
     col='blue')

hist(v,ylab='Frequência',
     xlab='Classes',
     main='Meu histograma',
     col=c('blue','red','yellow','green'))
text(5,8,'Texto')

boxplot(v,horizontal = T)

#Dividindo a janela
set.seed(21)
v=rnorm(50,12,4)
par(mfrow=c(2,1))
hist(v)
boxplot(v,horizontal = T)

#Dados transformados
par(mfrow=c(2,1))
hist(log(v))
boxplot(log(v),horizontal=T,outline = F)
par(mfrow=c(1,1))
qqnorm(v)
qqline(v)

#Abrindo arquivo Excel
library(readxl)
dados=read_excel('planilha1.xlsx')
edit(dados)
dados$dep
dados$fator1
hist(dados$dep)
boxplot(dados$dep)

#Criando um gráfico de barras sem dispersão
table(dados$fator1)
barplot(table(dados$fator1))

#Gráficos qqplot
qqnorm(dados$dep)
qqline(dados$dep)

#Graficando com erro padrão
library(sciplot)
bargraph.CI(dados$fator1,dados$dep,lc=F,ylim=c(0,25))
abline(h=0)

edit(dados)
dados$fator2

bargraph.CI(dados$fator1,dados$dep, as.factor(dados$fator2))
text(1.4,19.8,'a')
text(locator(1),'b')

