########Para executar o código no RStudio, pressione Ctrl+Enter
2+2 
#R é uma calculadora
2 + 3           #É possível comentar qualquer parte do código
2 * 3
10 / 5
10 / (2 + 3)    #Obedeça à lógica dos parênteses
sqrt(2)       #Sempre se usa ponto e não vírgula
2^0.5
sin(2.5)        #Nome_da_função(argumentos_da_função)
sqrt(12.3^(3*1.2)/5) #Parênteses em ordem
log(100,10)     #Log de 100 na base 10. Função log com argumentos x=100 e base=10

#Objetos ou variáveis
x <- 2      #Símbolo tradicional de atribuição <-
x = 2       #Mesma coisa que usar =
x           #Chamando x
y = sqrt(x)
y           #Sempre chame o objeto recém-criado para conferir
z = x+y
z
#Nomes das variáveis podem ter ponto e underline
x.inicial = log(2)
x.final = sqrt(5)
x_inicial = sqrt(sqrt(2))
x_final = log(5)
#Tipo de dado numérico ou de caracteres
n = 25
s = "Alô, mundo! " # Tanto aspas simples como duplas podem ser utilizadas
mode(n)
mode(s)

#Vetores
v1 = c(1,2,3)  #Letra c é símbolo de concatenação
v1             #Chamando v1
#Cria um vetor com 6 números aleatórios, com média 5 e desvio padrão de 1
vn = rnorm(6,3,1)     
vn
#Criando vetores numéricos e de caracteres
vetor.N = c(1,2,3,4)         # Concatena valores numéricos
vetor.N
vetor.S = c("a","b","c","d") # Concatena caracteres
vetor.S
#Operações com vetores
v=c(11,8,5,24,9,8,7)
length(v) #Tamanho do vetor
sort(v)   #Ordena o vetor
rank(sort(v)) #Ranqueamento ou postos
sum(v)    #Soma
mean(v)   #Média
sd(v)     #Desvio padrão
#Criando uma sequência numérica rapidamente
#Veja o que acontece:
1:10
vetor_sequencia = c(1:10)
vetor_sequencia

#Dataframe é como uma planilha do Excel, composta por vetores colunas ou linhas
col1 = c(1,2,3,4,5,6)     #Isso é um vetor
col2 = c(4,48,17,25,19,9) #Isso também é um vetor
col3 = c('a','a','a','d','d','d')
df1 = data.frame(col1,col2,col3) #Isso cria um dataframe
df1                              #Chamando o dataframe 

#Ou então cria uma planilha no Excel e abre por aqui,usando 
#File>Import Dataset>From Excel>Aula2.xlsx 
#e depois nomeia como df2
df2

#Extraindo os vetores das linhas e das colunas de df1
df2
df2[,]   #A vírgula separa linhas (à esquerda) e colunas (à direita)
df2[1,]  #Etraindo a primeira linha de todas as colunas
df2[,1]  #Etraindo a primeira coluna de todas as linhas
df2[3,2] #Extraíndo o elemento da terceira linha e segunda coluna

#Extraíndo diretamente as colunas usando $
df2$col1
df2$col2
df2$col3  #Mostra os níveis (levels) porque é um fator

#Testando se as colunas são numéricas ou fatores
df2$col1
is.numeric(df2$col1)
is.factor(df2$col1)
df2$col2
is.numeric(df2$col2)
is.factor(df2$col2)
df2$col3
is.numeric(df2$col3)
factor(df2$col3)

#Trabalhando com dados embutidos no R. Tente library(help = "datasets")
View(airquality)
dim(airquality) #153 linhas e 6 colunas. NA = Not Available
airquality[1:6,] #Mostrando as 6 primeiras linhas
airquality$Temp
airquality$Wind
airquality$Month
#Estatística básica do vetor airquality$Temp
mean(airquality$Temp)
median(airquality$Temp)
sd(airquality$Temp)
max(airquality$Temp)

#Filtrando a planilha com subset
air_maio = subset(airquality, (Month == 5)) #Cria um dataframe só com o mês 5
View(air_maio)
subset(airquality, (Month == 9 & Temp > 90 )) #Símbolo AND
subset(airquality, (Month == 6 | Month == 9)) #Símbolo OR
subset(airquality, Month %in% c(5,6))

#Gráficos básicos
hist(airquality$Temp)    #Histograma de todos os valores de Temp
hist(airquality$Temp,main='Título')    #Incluindo argumentos para modificar o gráfico
hist(airquality$Temp,main='Título',xlab='Temperatura',ylab='Frequência')
boxplot(airquality$Temp) #Boxplot de todos de valores de Temp
boxplot(airquality$Temp ~ airquality$Month) #Boxplot da temperatura em função dos meses. Isso é muito útil.
boxplot(airquality$Temp ~ airquality$Month,outline=F) #Boxplot da temperatura em função dos meses. Isso é muito útil.
boxplot(airquality$Temp ~ airquality$Month, xlab='Mês', ylab='Temperatura',main='Distribuição mensal da Temperatura')

