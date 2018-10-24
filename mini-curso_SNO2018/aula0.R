#Pacotes para instalar
library(vegan)
library(readxl)
library(sciplot)

#Abrir aula0.xlsx com Import dataset
#e atribuir ao objeto df

#Testando o dataframe
df <- read_excel("aula0.xlsx")
View(df)
df$fator_B
df$resp1

#Separando o df em dois: fatores e numéricos
df_fat=df[,1:2]
df_fat
df_num=df[,3:length(df)]
df_num

#Total das colunas
tot_c=colSums(df_num)
tot_c
#Total das linhas
tot_r=rowSums(df_num)
tot_r

bargraph.CI(df$fator_A,tot_r)
bargraph.CI(df$fator_B,tot_r)

#Realizando um teste-t ente níveis o fator A
t.test(tot_r ~ df$fator_A)
#p_valor = 0,20
