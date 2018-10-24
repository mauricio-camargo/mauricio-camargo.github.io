#Instalar e abrir o pacote vegan
library(vegan)

#Abrir Aula3.xlsx com Import dataset
#e atribuir ao objeto df3

#Testando o dataframe
library(readxl)
df3 <- read_excel("/home/mauricio/Dropbox/0000aaComunidades-Oceano2018/Comunidades-2017/Aula3/Exerc1.xlsx")
View(df3)
df3$Amostra
df3$Sp1

#Separando o df em dois: fatores e numéricos
df3fat=df3[,1:2]
df3fat
df3num=df3[,3:length(df3)]
df3num

colSums(df3num)
Tot #Abundância total das espécies
N=rowSums(df3num)
N #Número de indivíduos
S=specnumber(df3num)
S #Número de espécies

#Calculando a riqueza de Margalef 
Dmg=(S-1)/log(N)
Dmg
D=diversity(df3num, "simpson") #Expresso como 1-D
D
H=diversity(df3num, "shannon")
H

df3desc=data.frame(N,S,Dmg,D,H)
df3desc


