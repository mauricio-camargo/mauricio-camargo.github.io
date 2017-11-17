library (readxl)
enquete=read_excel('enquete.xls')
enquete
names(enquete)
edit(enquete)

#Variável contínua
enquete$peso
#Explorando
peso=enquete$peso
peso
#Analisando a distribuição
#Graficamente
par(mfrow=c(2,1))
hist(peso,breaks =11)
boxplot(peso,horizontal=T,
        outline=F)
par(mfrow=c(1,1))
qqnorm(peso)
qqline(peso)
#Teste de hip de Shapiro
shapiro.test(peso)

#Normalidade rejeitada, aplica transf.
qqnorm(log(peso))
qqline(log(peso))
shapiro.test(log(peso))

#Mesma coisa para altura
altura=enquete$altura
par(mfrow=c(2,1))
hist(altura)
boxplot(altura,horizontal = T)
par(mfrow=c(1,1))
qqnorm(altura)
qqline(altura)
shapiro.test(altura)
shapiro.test(log(altura))

#Variável categórica
enquete$sexo
is.factor(enquete$sexo)
sexo=as.factor(enquete$sexo)
sexo
table(sexo)
barplot(table(sexo))
pie(table(sexo))#Nunca faça isso

#Variável categórica multiestado
names(enquete)
roupa=as.factor(enquete$roupa)
roupa
barplot(table(roupa))
roupa_ord=factor(roupa,levels=c('P','M','G'))
barplot(table(roupa_ord))

#Relacionando duas variáveis
#dep (cont) ~ indep (categ)
boxplot(peso ~ sexo)
boxplot(peso ~ roupa)
boxplot(peso ~ roupa_ord)
#Dep (cont) ~ indep (cont)
plot(peso ~ altura)

#Teste homocedasticidade
boxplot(peso ~ sexo)
library(sciplot)
bargraph.CI(sexo,peso,ylim=c(55,80))
bartlett.test(peso ~ sexo)#Heterocedástico
#Transformação para estabilizar as variância
bartlett.test(log(peso) ~ sexo)#Heterocedástico

#Teste de médias (teste-t)
t.test(log(peso) ~ sexo,var.equal=T)

#Caso especial de: Teste-t pareado ou dependente
antes=c(12,7,10,14,9)
depois=c(15,8,9,17,14)
boxplot(antes,depois)
t.test(antes,depois,paired=T)

