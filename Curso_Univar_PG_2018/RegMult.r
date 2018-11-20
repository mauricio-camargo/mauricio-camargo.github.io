library(readxl)

costao=read_excel('Costao.xlsx')
names(costao)
pairs(costao)#Suspeita de colinearidade entre inclinações
cor(costao$Inclin_NS,costao$Inclin_LO) #Colineares
#Retiramos Incli_NS da análise
model1=lm(Abund~Inclin_LO+Insolacao+Dessecacao+Cob_Veg+Ondas,data=costao)
summary(model1)
library(MASS)
stepAIC(model1)
model1_P=lm(Abund~Inclin_LO+Insolacao+Dessecacao,data=costao)
predict(model1_P,list(Inclin_LO=0.03,Insolacao=100,Dessecacao=500),interval='confidence')

peixes=read_excel('Peixes.xlsx')
names(peixes)
pairs(peixes)#Suspeita de colinearidade entre presa e OD
cor(peixes$presas,peixes$OD) #Não são colineares
model2=lm(abund~presas+OD+temp+Sali+veget+MO,data=peixes)
summary(model2)
stepAIC(model2)
model2_P=lm(formula=abund~presas+OD+Sali,data=peixes)
predict(model2_P,list(presas=12,OD=95,Sali=30),interval='confidence')
