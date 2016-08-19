2*5
# Olá, tudo bem.
#Usado para comentar o código

#Álgebra simples
5+6
12-6
12*5
14/5
4 + (5/3 - 4)
5 - (5*4 + 4) - (12/6*5)
12^2
5^3

sqrt(16) #sqrt é a função e 16 é o argumento da função
# Número decimal no R é separado por ponto
3.5 + 2.7
3,5 + 2,7 #Dá erro
log(100,10)

#criação de variáveis
maria = 8
maria
joao.alberto = 12
joao.alberto


# Operações com objetos
x = 5
y = 3
z = x + y
z
#Armazendo resultado de função
w = sqrt(36)
#Argumento de função como variável
v=100
sqrt(v)

#Forma alternativa de atribuir uma variável
k = 12
k <- 12 #Símbolo de atribuição

#Série de dados = vetor
# Inserir vetores no R
altura = c(1.72,1.89,1.53,1.65,1.77)
altura

#Cálculos com vetores
#Soma dos elementos
sum(altura)
#Número de elementos do vetor
length(altura)
media = sum(altura) / length(altura)
hist(altura)
hist(altura,main='Título gráfico')
hist(altura,main='')#Sem título
hist(altura,
     main='Título principal',
     ylab='Eixo y',
     xlab='Eixo x',
     col='blue')

hist(altura,
   main='Título principal',
   ylab='Eixo y',
   xlab='Eixo x',
   col=c('blue','red','green','yellow'))

#Exercício
# Seja a amostra de tamanho do pé
# 35,42,36,39,36,40,42,35,42
# Criar um vetor, extrair a média e construir um histograma

pe=c(35,42,36,39,36,40,42,35,42)

pe=c(35,42,36,39,36,40,42,35,42)
mean(pe)
hist(pe)
