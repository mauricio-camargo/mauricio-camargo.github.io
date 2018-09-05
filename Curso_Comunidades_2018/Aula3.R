#Abrindo planilha do Excel
#Usar o menu <File><Import Dataset> para abrir o arquivo Aula2.xlsx
#Você também pode copiar os códigos gerados na janela de importação 
library(readxl)
Aula2 <- read_excel("Curso_Comunidades_2018/Aula2.xlsx")
View(Aula2)

Aula2$col1
Aula2$col2
Aula2$col3

mean(Aula2$col2)
hist(Aula2$col2) #Histograma
boxplot(Aula2$col2)

