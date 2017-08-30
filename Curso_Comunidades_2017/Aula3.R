#Instalar e abrir o pacote vegan
library(vegan)

#Abrir Aula3.xlsx com Import dataset
#e atribuir ao objeto df3

#Testando o dataframe
library(readxl)
df3 <- read_excel("E:/Dropbox/000Comunidades-Oceano2017/Aula3/Aula3.xlsx")
View(df3)
df3$Amostra
df3$Sp1

#Separando o df em dois: fatores e numéricos
df3fat=df3[,1:2]
df3fat
df3num=df3[,3:7]
df3num

Tot=colSums(df3num)
Tot #Abundância total das espécies
N=rowSums(df3num)
N #Número de indivíduos
S=specnumber(df3num)
S #Número de espécies

#Calculando a riqueza de Margalef 
Dmg=(S-1)/log(N)
D=diversity(df3num, "simpson") #Expresso como 1-D
H=diversity(df3num, "shannon")

