# Comentário

#PRIMEIRA SESSÃO

#R como calculador
1+1
2+4
5-2
12/4
12*5
5^2
# Lógica de parênteses deve ser obedecida
(5*4) + 5
(6+4)*(4+6)
#Parênteses aninhados
3*((3+4)/2)

#Separador decimal é o ponto
12.4+5.8
15,6+1 #ERRO

#FUNÇÕES EMBUTIDAS
sqrt(4)
sqrt(169)
#Função com dois argumentos
log(100,10)#Argumentos não nomeados
log(x = 100,base = 10)#Argumentos nomeados

#OUTRAS FUNÇÕES
round(12.4)
round(12.6)
abs(-12)
sin(.98)

###### OBJETOS OU VARIÁVEIS
joao=12
joao
#Símbolo de atribuição tradicional
joao <- 12

#Outros exemplos
x=15
y=12
z=x+y
z
#Outros exemplos
x=log(1000,10)
y=sqrt(144)
z=x/y
z
#Remover objetos
rm(z)
z
#Nomes de objetos
#Tem que começar com letra
#Máx 256 caracteres
x12=432.65
#Pode ter _ e .
trat.inicial=434
tratamento_final=654654

#Armazenar texto (caracter ou string)
s='texto simples'
s

#VETORES (conj. de dados do mesmo tipo,
#podendo ser numérico ou de string)
#Criando um vetor
v = c(3,7,9,11)
v
s = c('a','b','c','d')
s
S#Minúscula é diferente de maiúscula

#Misturando números com texto
w=c(12,'y')
w

#Construindo vetores
#Usando sequencia de numeros
1:10
10:1
vetor1=1:27
vetor1
#Função seq
seq(1,10)
seq(1,10,0.5)
#Função rep para repetição
rep(12,5)
#Criar um vetor correspondente a um fator
fator=rep('inicial',3)
fator
fatorlongo = c( rep('inicial',3), rep('final',3) )
fatorlongo

#CÁLCULO DE VETORES
x = c(2,5,7,10)
x
x + 3
x^2
x
log(x)

#índices de vetores
x[3]
x[2]
x[5]
x
x[2:4]

#Funções vetoriais
x
length(x) #Número de elementos
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

#Criando vetores de números aleatórios
rnorm(12,5,2)

set.seed(15)
rnorm(10)

x=rnorm(100,5,2)
mean(x)
sd(x)

trunc(runif(15,5,15))


#Simulação
set.seed(21)
v=rnorm(5,7,2)
mean(v)
sd(v)

set.seed(21)
v=rnorm(20,7,2)
mean(v)
sd(v)

set.seed(21)
v=rnorm(1000,7,2)
mean(v)
sd(v)

#Gráficos simples
set.seed(21)
v=rnorm(50,12,4)
hist(v)#Função de alto nível
text(5,8,'Texto')#Função baixo nível

hist(v,ylab='Frequência',
     xlab='Classes',
     main='Meu histograma',
     col='blue')

hist(v,ylab='Frequência',
     xlab='Classes',
     main='Meu histograma',
     col=c('blue','red','yellow','green'))
text(5,8,'Texto')
