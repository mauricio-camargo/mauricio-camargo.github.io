#Abrindo os pacotes usados (instale se necessário)
library(vegan)
library(readxl)
library(sciplot)
library(doBy)

#Abrir Aula3.xlsx com Import dataset 
#e atribuir ao objeto o nome df3

View(df3)

#Separando o df em dois: fatores e numéricos
df3fat=df3[,1:2]
df3fat
df3num=df3[,3:7]
df3num

#Extraíndo o vetor Local, que é um fator com dois níveis, Controle e Impacto, e dando o nome de Loc
Loc=df3fat$Local

#Vamos trabalhar apenas com o número de espécies (S)
S=specnumber(df3num)
S

#Crinado um novo dataframe chamado dados contendo os vetores Local e S.
dados=data.frame(Loc,S)
dados

#Extraíndo a média, o desvio padrão e outras medidas de S
mean(S)
sd(S)
var(S)
max(S)
min(S)

#As médias acima são globais, incluindo todas as amostras, de Controle e Impacto.

#Abaixo eu mostro uma maneira de extrair o sumário por grupos usando a função summaryBy, do pacote doBy.

summaryBy(N~Loc,data=dados,FUN=c(mean,sd,var,max,min))

#Verificando a distribuição de N com um histograma
hist(S)

#Pergunta: os dados parecem ajustados à distribuição normal?

#Comparando graficamente os dois níveis (Controle e Impacto) usando a função bargraph.CI do pacote sciplot
#A função gera automaticamente um gráfico com as médias e erro padrão.
bargraph.CI(x.factor=Loc,response=S,data=dados)

#Melhorando o gráfico
bargraph.CI(x.factor=Loc,response=S,data=dados,lc = F)
abline(h=0)

#Realizando um teste-t para comparar médias as médias entre Controle e Impacto
t.test(N~Loc,data=dados,var.equal=T)

#Resultado:
#p-valor=0,29
#Como o resultado do p-valor foi maior do que 0,05 então aceita a hipótese nula (H0), de que as médias não são diferente.


