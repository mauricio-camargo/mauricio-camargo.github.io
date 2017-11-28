#REGRESSÃO E CORRELAÇÃO
#Dados do exemplo
zoop=c(7,11,15,9,14,17,
       19,9,16,21,23,17)
sal=c(19:30)
plot(zoop~sal)

#Análise de regressão
reg=lm(zoop~sal)
reg #a e b
#Plotando a linha de ajuste
abline(reg)
#Escalas em zero
plot(zoop~sal,xlim=c(0,30),
     ylim=c(-10,26))

#Análise dos resíduos
res=reg$residuals
#Teste de normalidade dos resíduos
qqnorm(res)
qqline(res)
shapiro.test(res) # p>0.05 então é normal

#Análise de correlação
cor(zoop,sal)
r=cor(sal,zoop) #Coef de corr
r2=r^2 #Coef de determinação
r2

summary(reg)


