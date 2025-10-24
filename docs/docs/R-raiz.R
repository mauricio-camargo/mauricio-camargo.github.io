########## POR QUE R? ##########
# 1. Livre (grátis!).
# 2. Democratização do conhecimento.
# 3. Poderoso (Prof. Justiniano: não pergunte se o R faz, mas "como" faz).
# 4. Ajuda no aprendizado.
# 5. R é um programa para estatística e gráficos, mas também uma linguagem de programação.
# 6. Quem não compreender o R e/ou Python vai ficar para trás.
# 7. Por que o R faz milagres!
library(vegan)
data(dune)
plot(metaMDS(dune)$species)
########## POR QUE O RSTUDIO? ##########
# RStudio é uma IDE (Integrated Development Environment).
# R é quem faz a mágica (vem com uma IDE muito simples e sem recursos). 
# A IDE do RStudio é riquíssima. Vale a pena explorar.
########## R COMO CALCULADORA DE LUXO ##########
# O símbolo de hashtag significa um Comentário
1+1 
5-2
12/4
12*5
2^2
4^0.5 #Equivale à raiz quadrada
# Lógica dos parênteses
(5*4) + 5
(6+4)/(5-2)
# Parênteses aninhados
3*((3+4)/2)
17*(12/4 + (2^5/5)) 
# Ponto como separador decimal
12.4 + 8
12,4 + 8  #Dá um erro
#Funções embutidas
sqrt(16)
#Função com mais de um argumento
log(100,10) #Argumento não nomeado
log(x=100,base=10) #Argumento nomeado
#Outras funções
round(12.4)
round(12.6)
trunc(12.6)
abs(-12)
sin(.98)

########## TIPOS DE DADOS NO R ####
# Existem 3 tipos básicos de dados no R
# 1. Inteiro (numérico)
12
# 2. Decimal (numérico)
12.75
# 3. Caracteres (ou string, ou texto)
'texto' #Aspas simples ou duplas podem ser usadas
########## OBJETOS (OU VARIÁVEIS) ####
maria = 8
joao.alberto = 12
ana_moser43 = 64
print(maria) #Não é necessário print
maria #Chamando a Maria 
# Forma alternativa de atribuição
x = 12
y <- 15 #Forma antiga mas ainda muito comum 
# CUIDADO:  no R, x (minúsculo) é diferente de X (maiúsculo).

# Operações com objetos
x=5
y=7
s = 'teste'
z = x+y
z
# Importante: R é uma linguagem não declarativa.

########## FUNÇÕES EMBUTIDAS NO R ##########
# Função com um único argumento
sqrt(16)
# Exemplo: Calcular a proporção áurea
(1 + sqrt(5))/2 
#Função com dois argumentos
log(100,10) #Função não nomeada
log(100)
log(x=100,base=10) #Função nomeada
# Armazenando o resultado de uma função 
w = sqrt(36)
w
v=100
sqrt(v)
# Importante: podemos construir as nossas próprias funções!

########## OBJETOS DE DADOS NO R ##########
# Objetos de dados servem para armazenar dados de diferentes maneiras
# Existem 4 tipos básicos de objetos de dados:
# 1. Vetores
# Vetor é um objeto contendo dados do mesmo tipo em uma dimensão (coluna ou linha):
# Exemplo: 
v = c(3,7,4,9)
v
s = c('A','D','G','M')
s
# 1. Matrizes
# Matriz é um objeto contendo dados do mesmo tipo em duas dimensões (colunas e linhas):
# Pode ser visto como uma coleção de vetores (nas linhas ou nas colunas)
# Exemplo:
v1 = c(1,2,3,4) 
v2 = c(6,7,8,9)
v3 = c(10,11,12,13)
m = cbind(v1,v2,v3)
m
# 3. Dataframe (DF)
# Semelhante às matrizes, mas pode conter mais de um tipo de dado nas colunas.
# Pode ser visto como uma planilha, que pode ter colunas de diferentes tipos de dados.
nome = c('Fulano','Beltrano','Ciclano')  # Criando o vetor de nomes
idade = c(12,18,20) # Criando um vetor numérico
id = c(101,102,103) 
df = data.frame(nome,idade,id)
df
# 4. Listas
# Listas são objetos que podem armazenar qualquer coisa (vetores, matrizes e dataframes)
lista = list(123,v,s,m,df)
lista
########## VETORES ##########
# Vetor é um conjunto de dados do mesmo tipo (numérico ou de string)
# Criando um vetor com a função c()
v = c(3,7,9,11)
v
s = c('a','b','c','d')
s
# Misturando números com texto não pode.
w=c(12,'y') # Mas não dá erro. Por quê?
w

# Construindo vetores de outras formas
# Usando sequencia de numeros
1:100
10:1
vetor1=1:27
vetor1
# Função seq
seq(1,10)
seq(1,20,2)  #Sequência de dois em dois 
seq(20,1,-2) #Sequência inversa
# Função rep 
rep(12,5)
vr = c(rep('a',5) , rep('b',5))

#Um vetor de caracteres pode corresponder a um fator 
#Fator é um vetor de caracteres que definem categorias
#Criando um fator na mão:
fat1=c('Norte','Norte','Sul','Sul')
#fat1 ainda não é um fator.
fat1
#Preciso perguntar se é um vetor 
is.factor(fat1)
#Precisa dizer ao R que isso é um
fat1 = as.factor(fat1)
is.factor(fat1)
fat1
#Usando rep para criar fatores
fat2=rep('inicial',3)
fat2
fat3=rep('final',3)
fat3
fatlongo = c( rep('inicial',3), rep('final',3) )
fatlongo = as.factor(fatlongo)
fatlongo
#Ou então a função gl (generate levels)
gl(2,3,6,labels = c('inicial','final'))

# Cálculo de vetores
x = c(2,5,7,10)
x
x + 3
x^2
log(x)

# Índices de vetores
x = c(3,8,5,12,4)
x
x[1]        # Primeiro o elemento
x[4]
2:5
x[2:5]      # Do segundo ao quinto elemento
x[c(2,4)]   # Segundo E quarto elemento

# Atribuir valores a um elemento do vetor
x[3] = 99           # Atribuir um elemento individual
x
x = c(x, 33)        # Concatenar um elemento a um vetor
x

#Funções vetoriais
x
n = length(x) #Número de elementos
sum(x)
#Calcular manualmente a média do vetor
media=sum(x)/length(x)
media
#Função interna que calcula a média
mean(x)
median(x) #Mediana
var(x) #Variância
sd(x) #Desvio padrão
range(x)
min(x)
max(x)
summary(x)

#Criando vetores de números aleatórios da distribuição normal
r = rnorm(12,5,2)
mean(r)
sd(r)

#Gerar sempre o mesmo número aleatório
set.seed(15)
rnorm(10)

#Especificando o valor da média e desvio que os números aleatórios devem ter
x=rnorm(100,5,2)
mean(x)
sd(x)

#Criando números aleatórios da distribuição uniforme.
runif(15,5,15)

#Equivalente da função ALEATÓRIOENTRE do Excel
trunc(runif(15,5,15))

# Excluindo ítens do vetor
x = c(0,3,8,5,12,4)
x[-1]        # Todos, exceto o primeiro
x[c(-2,-3)]  # Todos, exceto o segundo e o terceiro

# Filtros em vetores
# Comparações no R
# == é igual?
# >  é maior?
# <  é menor?
# >= é maior ou igual?
# <= é menor ou igual?
# != é diferente?
# Operadores booleanos
# & é usado como AND (E)
# | é usado como OR (OU)

x = c(0,3,4,5,8,12)
x[x >= 7]                # Filtragem lógica
x[(x < 5) & (x != 0 )]  # Filtragem lógica com operador booleano &
x[(x <= 3) | (x > 9 )]  # Filtragem lógica com operador booleano &


########## DATAFRAMES (DF) ##########
# Dataframe sempre é bidimensional (Linhas X Colunas).
# Cada coluna é um vetor do mesmo comprimento.
# Cada coluna pode ser de um tipo diferente de dado (numérico ou de caracteres).
# R pode substituir o Excel em planilhagem.

# Como criar um Dataframe usando a função data.frame()
id = 1:4
sexo = c('F','M','M','F')
altura = c(1.58, 1.87, 1.75, 1.72)
peso = c(62, 91, 78, 72)
df = data.frame(id,sexo,altura,peso)
df

# Filtros são feitos usando os índíces bidimensionais (Linhas X Colunas).
df[2,3] # Segunda linha e terceira coluna
df[2:4,1:3] # Segunda até quarta linha e da primeira até terceira  coluna
df[c(1,4),c(1,3)] # Segunda linha e terceira coluna
# Extraindo a segunda coluna inteira
df
df[,2]
# Extraindo a terceira linha inteira
df[3,]

df[c(1,3),]   # Extrai a linha 1 e a linha 3 inteiras.
df[c(1,3),2]   # Extrai a linha 1 e a linha 3 da segunda coluna.
df[,c('sexo','peso')] # É possível extrair colunas pelos nomes.
# Outra forma de extrair vetores das colunas de um DF, usando $
df$sexo
df[,2]
df$sexo
df$altura
# Para criar uma nova coluna, basta atribuir um novo vetor.
df$novacoluna = c(43,12,87,66)
df
df# Novas colunas podem ser resultados de cálculos com os vetores
df$imc = trunc(df$peso / df$altura^2)
df

# Os poderosos filtros em dataframes no R
# Os filtros funcionam tal como em vetores e matrizes, aplicados separadamente às linhas e colunas do dataframe.
df
# Selecionando as linhas com imc > 24
df[df$imc > 25, ]  
# Selecionando as linhas das mulheres com peso < 77
df[(df$sexo=='F') & (df$peso < 77) , ] 
# Selecionando as linhas dos homens com peso > 80 e mostrando apemas o id e imc.
df[(df$sexo=='M') & (df$peso > 80) , c('id','imc')] 
df
# Exemplo mais prático
local = c('L1','L1','L1','L2','L2','L2')
amostra = c('a1','a2','a3','a1','a2','a3')
abund = c(23,45,0,56,0,25)
# Criando um DF
df2 = data.frame(local,amostra,abund)
df2
# Transformando local e amostra em fatores
df2$local = as.factor(df2$local)
is.factor(df2$local)
df2$amostra = as.factor(df2$amostra)
is.factor(df2$amostra)
# Extraia o vetor correspondente à primeira coluna.
df2[,1]
# Extraia o elemento da segunda linha e terceira coluna.
df2[2,3]
# Extraia apenas as linhas correspondentes aos locais L1.
df2[df2$local == 'L1',]
# Extraia apenas as linhas dos locais L2 
#em que a abundância seja maior que 30.
df2[(df2$local == 'L2') & (df2$abund > 30) , ]
# Extraia apenas as colunas amostra e abund dos 
#locais L1 em que a abundância seja diferente 
#de zero.
df2[(df2$local=='L1') & (df2$abund != 0),c('amostra','abund')]

# Outro exemplo de dataframe
estacao = c(rep('V',4) , rep('I',4))
local = rep(c('L1','L2'),4)
set.seed(18)           # Semente dos números aleatórios a seguir
sp1 = trunc(runif(8,0,4))
sp2 = trunc(runif(8,0,12))
sp3 = trunc(runif(8,0,6))
sal = round( rnorm(8,25,8) , 1)
temp = round( rnorm(8,20,6) , 1)
df3 = data.frame(local,estacao,sp1,sp2,sp3,sal,temp)
df3

# Fatores em Dataframes 
# Variáveis categóricas são chamadas de fatores (factors) no R, e as categorias são chamadas de níveis (levels).
is.factor(df3$estacao)  #Testando se é um fator
df3$estacao = as.factor(df3$estacao)  #Transforma o vetor num fator
is.factor(df3$estacao)  #Testando novamente
df3$estacao  # Agora aparecem os níveis

# Funções específicas para dataframes 
head(df3, 3)      # primeiras linhas
tail(df3, 3)
dim(df3) 
nrow(df3) 
ncol(df3)
names(df3)        # nomes das colunas
str(df3)          # estrutura (tipos por coluna)
summary(df3)      # resumo estatístico
df3
# Fatiando um DF
# Separe o df1 em três novos DF:
# 1. fat (fatores: local e estacao)
fat = df3[,1:2]
fat
# 2. bio (bióticos: espécies)
bio = df3[,3:5]
bio
# 3. abio (abióticos: sal e temp)
abio = df3[,6:7]
abio

# Crie os novos DF
# 1. tab_bio = Fatores + dados bióticos apenas
tab_bio = data.frame(fat,bio)
tab_bio
# 2. tab_abio = Fatores + dados abióticos apenas
tab_abio = data.frame(fat,abio)
tab_abio
# 3. tab_inv = Fatores + dados bióticos e 
#filtrar as linhas de inverno
tab_inv = data.frame(fat,bio)
tab_inv = tab_inv[tab_inv$estacao=='I',]
tab_inv
# 4. tab_ver = Fatores + dados bióticos e 
#filtrar as linhas de verão
tab_ver = data.frame(fat,bio)
tab_ver = tab_ver[tab_ver$estacao=='V',]
tab_ver

# Filtrando o DF
# 2. Crie um novo DF contendo apenas amostras 
#do inverno com temperatures abaixo de 15 graus.
# 3. Crie um novo DF contendo apenas amostras com 
# salinidade abaixo de 30 OU temperatures acima de 20 graus.
tabts = df3[df3$sal<30 | df3$temp>20,]
tabts
# 4. Crie um novo DF contendo apenas amostras do 
#inverno com abundâncias da espécies sp3 diferentes 
#de zero.
tabab = df3[(df3$estacao=='I') & (df3$sp3 != 0),]
tabab
# 5. Crie um novo DF contendo apenas amostras do verão 
#com abundâncias da spp1 E da spp2 maiores que zero.
tabtot = df3[df3$estacao=='V' & df3$sp1>0 & df3$sp2>0,]
tabtot

# Cálculos com DF
# 1. Calcule o valor médio e o desvio padrão 
#da salinidade
mean(df3$sal)
sd(df3$sal)
# 2. Calcule o valor máximo e mínimo da temperatura
max(df3$temp)
min(df3$temp)
# 3. Calcule a abundância total das 3 espécies (soma das 3 abundâncias por linha)
bio
bio$abutot = sp1 + sp2 + sp3
bio
########## Planilhas no R ###########
# Uma planilha do Excel pode ser aberta no R e convertida para um dataframe.
# SIMULAR A CONSTRUÇÃO E ABERTURA DE UMA PLANILHA DO EXCEL.
# Usar o pacote readxl 

#Para instalar o pacote
#install.packages('readxl')
library(readxl)
#Atribuir working dir antes de executar
plan = read_excel('planilha.xlsx')
plan$Col2
plan$Col2 = as.factor(plan$Col2)
is.factor(plan$Col2)


########## GRÁFICOS NO R ##########
x = rnorm(100)
mean(x)
# Plotando um histograma
hist(x)
y1 = x^2
# Plotando um digrama de dispersão
plot(x,y1)


y2 = x^3
plot(x,y2)
par(mfrow=c(1,2)) # Divide a janela gráfica em duas
plot(x,y1,ylab='y primeiro',xlab='xunico',pch=19,ty='l')
legend('topright',legend='y=x^2',pch=19)
plot(x,y2,ylab='y segundo',xlab='xunico',pch=19,ty='l')
legend('topleft',legend='y=x^3',pch=19)

#Mesmo gráfico com 2 y
par(mfrow=c(1,1))
plot(x,y1, xaxt='n',yaxt='n',col='red')
axis(1)
axis(2)
par(new=TRUE)
plot(x,y2, xaxt='n',yaxt='n',col='blue')
axis(4)
legend('top',legend=c('y=x^2',y='y=x^3'),pch=c(19,19),col=c('red','blue'))

# Elaborando um gráfico
altura = rnorm(100,1.7,.5)
altura
hist(altura)
hist(altura,main='Título',
     ylab='Frequência',
     xlab='Altura (m)',
     col=c('blue','red','yellow','gray'))
text(.5,15,'texto')
text(1,30,'texto2')

abline(v=median(altura),col='blue')

boxplot(altura)
#Dois gráficos na mesma janela
par(mfrow=c(1,2))
hist(altura)
boxplot(altura)


########## GRÁFICO JITTER (dot-plot)####

set.seed(8642)  #Vamos sempre gerar o mesmo número
n = 30
x = round(runif(n,1,5))
y = x + rnorm(n, mean=0, sd=3)
y

par(mar = c(3, 3, 1, 1))

plot(x,y)
plot(jitter(x),y)
boxplot(y~x)

boxplot(y ~ x,                            
        col = "yellow",
        pch = 16)
points(jitter(x), y,                      
       col = "blue",
       pch = 16)


