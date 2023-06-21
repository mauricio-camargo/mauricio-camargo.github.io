dados = read.csv2(         #Abrindo os dados
   "/home/mauricio/Dropbox/Projetos/Programacao em Python e R - 2021/Analise Dados/IBGE1/IMB201009.txt",
   header=FALSE, 
   sep="")
View(dados)
n=length(dados$V4)      #Número de linhas de V4
plot(1:n,                 #Plota x e y
   dados$V4) 
plot(1:n,                 #Mudando as características do plot
   dados$V4,
   type='line',
   xlab='',ylab='') 

#Agora vamos ajeitar o eixo x, que ainda não é do tipo datetime
tempo=paste(dados$V1,dados$V2) #concatena as duas colunas de Data e Hora
tempo
tempo=as.POSIXct(tempo,format = "%d/%m/%Y %H:%M:%S")
tempo 
#Cria o plot completo contendo a série V3 em azul
plot(tempo,                #Eixo x
     dados$V3,             #Eixo y
     type='line',          #Tipo de linha
     col='blue',           #Cor da linha
     main='IMB201009.txt',  #Título do gráfico
     ylab='Nível (m)',     #Título do eixo y
     xlab='Tempo')         #Título do eixo x
lines(tempo,         #Adiciona nova série (V4) em vermelho
      dados$V4,
      type='line',
      col='red')
legend('topright',  #Adiciona legenda
       legend=c('Var1','Var2'y),
       lty=c(1,1),
       col=c('blue','red'),
       cex=0.6)

update.packages(ask = FALSE, checkBuilt = TRUE)
tinytex::tlmgr_update()
