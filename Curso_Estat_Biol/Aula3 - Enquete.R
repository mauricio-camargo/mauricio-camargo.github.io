install.packages('readxl')
library (readxl)
# Vá em Session>Set working directory>To source file location
enquete=read_excel('Enquete.xls')
enquete
names(enquete)
edit(dados)

#Como extrair um vetor da planilha
enquete$idade
enquete$estado
enquete$ingles
is.factor(enquete$ingles)
is.factor(enquete$idade)
is.numeric(enquete$idade)
as.factor(enquete$ingles)

#1.Variáveis qualitativas nominais
enquete$olhos
#Graficando
olhos_tab=table(enquete$olhos)
olhos_tab
barplot(olhos_tab)
#Exemplo de nominal binária
sexo_tab=table(enquete$sexo)
sexo_tab
barplot(sexo_tab)
#Ajustando melhor a escala do eixo y
barplot(sexo_tab,ylim=c(0,12))
#Graficando pelas proporções
sexo_prop=prop.table(sexo_tab)
barplot(sexo_prop,ylim=c(0,0.7))

#Avançando um pouco
olhos_tab
barplot(olhos_tab,ylim=c(0,20))
text(0.7,4,'6')
text(1.9,15,'49')
text(3.1,5,'1')
text(4.3,17,'13')
#NUNCA TENTE ISSO
pie(olhos_tab)

#Variáveis qualitativas ordinais
enquete$ingles
ingles_tab=table(enquete$ingles)
ingles_tab
barplot(ingles_tab)
#Ordenando os níveis do fator
fator_ord=factor(enquete$ingles,
      levels=c('Básico','Médio','Avançado'))
ingles_ord=table(fator_ord)
barplot(ingles_ord)
#Mesmo para roupas
enquete$roupa
fator_ord1=factor(enquete$roupa,
       levels=c('P','M','G'))
roupa_ord=table(fator_ord1)
barplot(roupa_ord)

#Variáveis quantitativas discreta
enquete$calcado
#Medidas tend?ncia central
mean(enquete$calcado)#M?dia
median(enquete$calcado)#Mediana
sd(enquete$calcado)#Desvio padr?o
var(enquete$calcado)#Vari?ncia
#Erro padrão não tem no R
ep=sd(enquete$calcado)/
  sqrt(length(enquete$calcado))
summary(enquete$calcado)#Sumário 5 números
boxplot(enquete$calcado)
hist(enquete$calcado,breaks=4)
#Variáveis quantitativas contínuas
enquete$altura
mean(enquete$altura)
sd(enquete$altura)
var(enquete$altura)
hist(enquete$altura)

###GRÁFICOS BIVARIADOS####
#1.Qualitativa x Qualitativa
names(enquete)
olhos_sexo=table(enquete$olhos,
                 enquete$sexo)
olhos_sexo#tabela de contingência
#Gráfico de contingência
plot(olhos_sexo)
t(olhos_sexo)#Tabela transposta
plot(t(olhos_sexo))#Gráfico transposto

barplot(olhos_sexo)
barplot(t(olhos_sexo),
        legend.text=T)

#2. Qualitativa x quantitativa
plot(factor(enquete$roupa),
     enquete$altura)
plot(factor(enquete$sexo),
     enquete$altura)

#3. Quantitativas x quantitativas
plot(enquete$altura,
     enquete$calcado)
