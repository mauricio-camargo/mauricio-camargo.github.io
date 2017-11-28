library (readxl)
enquete=read_excel('enquete.xls')

#ANOVA de um fator
bargraph.CI(roupa,peso,ylim=c(50,90))
analise=aov(enquete$peso~enquete$roupa)
summary(analise)
TukeyHSD(analise)

####### Regressão e correlação
zoop=c(7,11,15,9,14,17,19,9,16,
       21,23,17)
sal=19:30
plot(zoop ~ sal,ylim=c(-10,30),
     xlim=c(0,30))
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

###### Regressão não-linear
conc=c(.3,.2,.1,.05,.02,.01,.005)
vel=c(3.6,6.3,3.2,2.6,2.1,1.4,.8)
length(conc)
length(vel)
plot(vel ~ conc)
reg=lm(vel ~ conc)
abline(reg)
#Tentar transformações linearizadoras
plot(vel ~ log(conc))#Melhorou
plot(log(vel) ~ conc)#Não Melhorou
plot(log(vel) ~ log(conc))#Não Melhorou
reg1=lm(log(vel) ~ log(conc))
abline(reg1)

#Outras relações linearizadoras
plot(conc/vel ~ conc)
plot(vel/conc ~ conc)

# Métodos de ajuste não-linear e não-paramétrico
plot(vel ~ conc)
lines(lowess(vel~conc))

#Regressão polinomial
pop=c(4835,4970,5085,5160,5310,
      5260,5235,5255,5235,5210,5175)
ano=1959:1969
length(pop)
length(ano)
plot(pop~ano,type='b')
#Tentando um modelo linear simples
mod1=lm(pop ~ ano)
abline(mod1)
#Polinomial grau 2
mod2=lm(pop~poly(ano,2))
lines(ano,predict(mod2),col='red')
#Polinomial grau 3
mod3=lm(pop~poly(ano,3))
lines(ano,predict(mod3),col='blue')

### spline
plot(pop ~ ano, ty='b')
lines(spline(ano,pop),col='blue')
