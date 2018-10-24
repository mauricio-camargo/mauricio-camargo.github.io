#Instalar e abrir o pacote vegan
library(vegan)
library(readxl)
library(sciplot)

#Abrir Aula1.xlsx com Import dataset
#e atribuir ao objeto df3

#Testando o dataframe
df3 <- read_excel("aula1.xlsx")
View(df3)
df3$Amostra
df3$Sp1

#Separando o df em dois: fatores e numéricos
df3fat=df3[,1:2]
df3fat
df3num=df3[,3:length(df3)]
df3num

tot=colSums(df3num)
tot #Abundância total das espécies
N=rowSums(df3num)
N #Número de indivíduos
S=specnumber(df3num)
S #Número de espécies

bargraph.CI(df3$Local,S)
bargraph.CI(df3$Local,N)

df3$Local
#Calculando a riqueza de Margalef 
Dmg=(S-1)/log(N)
Dmg
D=diversity(df3num, "simpson") #Expresso como 1-D
D
H=diversity(df3num, "shannon")
H

bargraph.CI(df3$Local,H)




