####### Regressão e correlação
zoop=c(7,11,15,9,14,17,19,9,16,
       21,23,17)
sal=19:30
plot(zoop ~ sal)
reg=lm(zoop ~ sal)
reg
summary(reg)
plot(zoop ~ sal)
abline(reg)
#Verificando a normalidade dos resíduos
res=reg$residuals
qqnorm(res)
qqline(res)
boxplot(res)
shapiro.test(res)

###### Regressão múltipla
zoop=c(75,76,82,82,76,83,76,74)
luz=c(110,95,75,90,85,80,105,120)
temp=c(26,28,34,31,29,36,25,23)
nutri=c(9,7,9,4,8,11,7,5)
length(zoop)
length(luz)
length(temp)
length(nutri)
dados=data.frame(zoop,luz,temp,nutri)
dados
pairs(dados)
cor(dados)#Coef. correlação
cor(dados)^2#Coef. determinação

#Modelo reg1 (simples)
reg1=lm(zoop~luz)
plot(zoop~luz)
abline(reg1)
cor(zoop,luz)#Coef.Corr
cor(zoop,luz)^2*100 #Coef. Det. 64%

#Modelo com 2 var. indep.
reg2=lm(zoop~luz+temp)
summary(reg2)#Coef. Det = 87%

#Modelo completo
reg3=lm(zoop~luz+temp+nutri)
summary(reg3)#Coef. Det. 94%

#Akaike Information Criteria (AIC)
AIC(reg1,reg2,reg3)

library(MASS)
stepAIC(reg3)

