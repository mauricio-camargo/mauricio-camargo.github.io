peso=c(34,67,48,53,65,36,24,45,23,27,35,32)
sexo=c('M','M','M','M','M','M','F','F','F','F','F','F')
length(peso)
length(sexo)
#Testar a normalidade gráfica
#Histograma
hist(peso)
#Boxplot(peso)
boxplot(peso,horizontal = T)
sort(peso)
##Qqplot
qqnorm(peso)
qqline(peso)
#Método inferencial para normalidade
shapiro.test(peso)
#p=0.23 portanto aceita Ho e peso é normal
