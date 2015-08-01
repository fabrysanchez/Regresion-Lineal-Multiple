#TRABAJO FINAL DE R
#FABRICIO SANCHEZ

#2.1
library(readxl)
library(DT)
data1 <- read_excel("poblacion1.xlsx",sheet=1,col_names = TRUE,na = "")
str(data1)
datatable(data1)
dim(data1)
data2 <- read_excel("poblacion2.xlsx",sheet=1,col_names = TRUE,na="")
str(data2)
datatable(data2)
dim(data2)

#2.2
poblacion <- merge(data1,data2)
datatable(poblacion)
dim(poblacion)

#2.3
#Identificar la clase de cada variable
clase <- numeric(ncol(poblacion))
for (i in 1:ncol(poblacion)){
  clase[i] <- class(poblacion[,i])
}
clase
summary(poblacion)
