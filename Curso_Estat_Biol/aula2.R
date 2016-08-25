#Gerando números aleatórios
#para simulação
set.seed(20)
dados=rnorm(n=30,mean=10,sd=2)
dados
hist(dados) #n=30

set.seed(20)
dados=rnorm(n=100,mean=10,sd=2)
dados
hist(dados) #n=100

set.seed(20)
dados=rnorm(n=1000,mean=10,sd=2)
dados
hist(dados) #n=1000

mean(dados) #Média
median(dados)
var(dados) #Variância
sd(dados)

erro_padrao=sd(dados)/sqrt(length(dados))
#OU
n=length(dados)
desviop=sd(dados)
erro=desviop/n
erro
