#Exemplo de teste de hipóteses
#Var dependente contínua
peso=c(52,58,78,98,48,55,61,75)
#Var independente categórica (fator com 2 níveis)
sexo=c('H','H','H','H','M','M','M','M')
length(peso)
length(sexo)
#Análise exploratória
hist(peso)
boxplot(peso)
#Teste de normalidade
shapiro.test(peso)
#Teste gráfico de normalidade
qqnorm(peso)
qqline(peso)

#Instalar pacote no R
#Aba Packages e Install
library(sciplot)
bargraph.CI(sexo,peso,lc=F,
            ylim=c(50,90))

#Teste de homogeneidade das
#variâncias (homocedasticidade)
bartlett.test(peso~sexo)

#Teste entre duas médias (H e M)
#Usa-se o teste-t, cujo pressuposto
#é a normalidade, que foi satisfeita.
t.test(peso~sexo,var.equal=T)

