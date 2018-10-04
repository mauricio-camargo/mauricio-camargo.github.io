library(sciplot)

#Realizando um teste-t
peso=c(34,67,48,53,65,36,24,45,23,27,35,32)
sexo=c('M','M','M','M','M','M','F','F','F','F','F','F')

#Médias
tapply(peso,sexo,mean)

######Exploração gráfica
boxplot(peso~sexo)
bargraph.CI(sexo,peso)

#####Verificando os pressupostos
###Normalidade gráfica
hist(peso)
qqnorm(peso)
qqline(peso)
###Teste de nomalidade por inferência (Shapiro)
shapiro.test(peso)
#p=0.23 Aceita Ho
##Teste de homocedasticidade (Bartlett)
bartlett.test(peso~sexo)
#p=0.27 Aceita Ho

#####Teste-t para a diferença entre médias
t.test(peso~sexo)
#p=0.18 Rejeita Ho
