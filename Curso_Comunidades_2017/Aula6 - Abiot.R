#Abrindo o arquivo Abiot.xlsx
sub$N
sub$Substrato

#Procedimento completo para testar a normalidade, a homocedasticidade
#e comparar as médias dos grupos.

#Análise graficamente a normalidade
hist(sub$N)
boxplot(sub$N,outline = F)
qqnorm(sub$N)
qqline(sub$N)

#Análise inferencial da normalidade
shapiro.test(sub$N)

#Analisando a homogeneidade das variâncias
library(sciplot)
bargraph.CI(sub$Substrato,sub$N)
bartlett.test(sub$N ~ sub$Substrato)

#Testar as médias entre Duro e Mole
t.test(sub$N ~ sub$Substrato, var.equal=T)

#Trabalhando com a aba setores
#Profundidade
set$prof
hist(set$prof)
boxplot(set$prof)
qqnorm(set$prof)
qqline(set$prof)
shapiro.test(set$prof)#Aceita H0
bargraph.CI(set$setor,set$prof)
bartlett.test(set$prof~set$setor)
#ANOVA
analise1=aov(set$prof~set$setor)
summary(analise1)
TukeyHSD(analise1)

#Salinidade
hist(set$sal)
boxplot(set$sal)
qqnorm(set$sal)
qqline(set$sal)
shapiro.test(set$sal)#Não-normal
#Transformando por log
shapiro.test(log(set$sal))#Não-normal
bartlett.test(set$sal~set$setor)
#Transformando por log
bartlett.test(log(set$sal)~set$setor)
analise2=aov(log(set$sal)~set$setor)
summary(analise2)
TukeyHSD(analise2)
