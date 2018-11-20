#CARREGANDO OS PACOTES NECESSÁRIOS
library(sciplot)
library(GAD)
library(readxl)
tabela=read_excel('planilha_dados.xlsx')

#ABRIR A PLANILHA tabela
names(tabela)
factor(tabela$area)

#ANALISANDO A SALINIDADE
#Explorando a variável
boxplot(tabela$sal~tabela$setor)
bargraph.CI(tabela$setor,tabela$sal)

#ANOVA de 1 fator entre os setores
#para salinidade
#Usando o R
anov_R=aov(tabela$sal~tabela$setor)
summary(anov_R)
#ou posso fazer assim
anov_R=aov(sal~setor,data=tabela)
summary(anov_R)

#Usando o GAD
setor_f=as.fixed(tabela$setor)
anov_GAD=lm(sal~setor_f,data=tabela)
gad(anov_GAD)
#A mesma an?lise usando setor como aleat?rio
setor_a=as.random(tabela$setor)
anov_GAD1=lm(sal~setor_a,data=tabela)
gad(anov_GAD1)
#GAD pode ser usado para teste de homocedasticidade
#de Cochran
C.test(anov_GAD)
#Graficando
bargraph.CI(setor,sal,data=tabela)

#Fazendo ANOVA nested de dois fatores
#(setor e area) para a salinidade
#Usando R
anov2_R=aov(sal~setor+area%in%setor,
            data=tabela)
summary(anov2_R)
#Usando o GAD
setor_f=as.fixed(tabela$setor)
area_a=as.random(tabela$area)
anov2_GAD=lm(sal~setor_f+area_a%in%setor_f,data=tabela)
gad(anov2_GAD)
#Graficando os dois fatores
bargraph.CI(setor,sal,area_a,
            data=tabela,
            lc=F,legend=T)


#OCYPODE: fully nested de 4 fatores
ocypode=read_excel('planilha_dados.xlsx',2)
names(ocypode)
R_a=as.random(ocypode$Regiao)
S_a=as.random(ocypode$Setor)
L_a=as.random(ocypode$Local)
P_a=as.random(ocypode$Parcela)
anov4_GAD=lm(Total~R_a+S_a%in%R_a+
               L_a%in%S_a%in%R_a+
               P_a%in%L_a%in%S_a%in%R_a,
               data=ocypode)
gad(anov4_GAD)

#Delineamento ortogonal de dois fatores fixos
#Portanto, não há necessidade de usar o GAD
#Usando o R
fatorial=read_excel('planilha_dados.xlsx',4)
names(fatorial)
anov_fat=aov(zoop~temp+sal+temp*sal,
             data=fatorial)
summary(anov_fat)
interaction.plot(fatorial$sal,
                 fatorial$temp,
                 fatorial$zoop)
#Invertendo o gr?fico
interaction.plot(fatorial$temp,
                 fatorial$sal,
                 fatorial$zoop)
#Fatorial2: N,P e K
fatorial2=read_excel('planilha_dados.xlsx',5)
names(fatorial2)
anov_fat2=aov(Prod~N*P*K,
              data=fatorial2)
summary(anov_fat2)
#Resposta de K
bargraph.CI(K,Prod,
            data=fatorial2)
interaction.plot(fatorial2$P,
                 fatorial2$N,
                 fatorial2$Prod)

