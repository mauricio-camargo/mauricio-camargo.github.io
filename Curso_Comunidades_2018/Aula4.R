#Abrir os pacotes necessários
library(readxl)
library(sciplot)
library(vegan)

#Abrir Aula4.xlsx usando Import Dataset
#e atribuir o nome de df

library(readxl)
df <- read_excel("~/Dropbox/0000aaComunidades-Oceano2018/Aula4/Aula4.xlsx")
View(df)

1:10 #Sequencia de 1 a 10

df[,1:2] # Extraindo as duas primeiras colunas 

df_fat = df[,1:2] #Atribuindo o dataframe de fatores
df_num= df[,3:7]  #Atribuindo o dataframe numérico

df_fat
df_num

#O pacote vegan traz cálculos de índices de diversidade
#Calcular o número de espécies
S = specnumber(df_num)
S
#Calcular o número de indivíduos
N = rowSums(df_num)
N
#Cálculos básicos
mean(N)
var(N)
sd(N)
min(N)
max(N)
N

#As médias acima são globais, incluindo todas as amostras,
#tanto de Controle quanto de Impacto.
#Abaixo um método para extrair os sumérios por grupos.
N #Vetor de abundância
loc=df[,2]
loc
tapply(N,loc,mean) #Média por grupos

#Extrair outros índices de diversidade
#Riqueza de Margalef
Dmg=(S-1)/log(N)
Dmg
#Shannon
H=diversity(df_num,index='shannon')
H
#Simpson
D=diversity(df_num, index='simpson')
D

#Criar um dataframe com os valores dos descritores de biodiversidade
df_desc=data.frame(N,S,Dmg,D,H)
df_desc

