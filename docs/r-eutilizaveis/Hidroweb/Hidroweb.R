library(readr)
#### Abrindo o arquivo dado vazoes_T_87905000.txt ####
ArqTxtPath='/home/mauricio/Dropbox/Projetos/Programacao em Python e R - 2021/Analise Dados/Hidroweb/vazoes_T_87905000.txt'
ArqTxt=read_lines(ArqTxtPath,skip=13)
ArqTxt[1]=paste0(ArqTxt[1],';') #Inserindo ";" na primeira linha para evitar problemas com row.names
ArqCsvPath=gsub('txt','csv',ArqTxtPath)
write_lines(ArqTxt,ArqCsvPath)
dados=read.table(ArqCsvPath,header=T,sep=';',dec=',')
View(dados)
#### Criando coluna com tipo datetime e plotando ####
dados$dataN=as.POSIXct(dados$Data,format = "%d/%m/%Y")
plot(dados$Maxima~dados$dataN,type='line')
#### Criando coluna dos meses ####
dados$mes = format(dados$dataN,format='%m')
#### Extraindo a media e dp ####
media=aggregate(dados$Maxima,list(Mes=dados$mes),mean,na.rm=T)
dp=aggregate(dados$Maxima,list(dados$mes),sd,na.rm=T)
#### Calculando desvio superior e inferior
mediaMais=media$x+dp$x
mediaMenos=media$x-dp$x
#### Plot final ####
plot(media$Mes,media$x, ty="l", col="blue", 
     ylab='Vazão', 
     xlab='Meses',
     lty=1,lwd=3,
     ylim=c(-1000,3000))
lines(media$Mes, mediaMais, col='gray')
lines(media$Mes, mediaMenos, col='gray')
polygon(x=c(media$Mes, rev(media$Mes)), y=c(mediaMais, rev(mediaMenos)), col="lightblue", density = 40, angle=60)
lines(x, media$x)
points(x, media$x,pch=19)
