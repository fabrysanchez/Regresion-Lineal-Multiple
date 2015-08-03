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
#Diagramas de cajas y barras
c <- function(i){
  boxplot(poblacion[,i])
}
for (i in 1:ncol(poblacion)){
  if (is.numeric(poblacion[,i])==T){
    c(i)
  }else{
    barplot(table(poblacion[,i]))
  }
}

#2.4 
#minimo, media, maximo, desv. estand.
mi <- numeric(8)
ma <- numeric(8)
med <- numeric(8)
dve <- numeric(8)
for (i in 1:ncol(poblacion)){
  if (is.numeric(poblacion[,i])==T){
    mi[i] <- min(poblacion[,i])
    ma[i] <- max(poblacion[,i])
    med[i] <- mean(poblacion[,i])
    dve[i] <- sd(poblacion[,i])
  }
}
mi
ma
med
dve

#cuartiles
quantile(poblacion[,1], probs = seq(0, 1, 0.25), na.rm = FALSE)
quantile(poblacion[,2], probs = seq(0, 1, 0.25), na.rm = FALSE)
quantile(poblacion[,3], probs = seq(0, 1, 0.25), na.rm = FALSE)
quantile(poblacion[,4], probs = seq(0, 1, 0.25), na.rm = FALSE)
quantile(poblacion[,5], probs = seq(0, 1, 0.25), na.rm = FALSE)
quantile(poblacion[,6], probs = seq(0, 1, 0.25), na.rm = FALSE)
quantile(poblacion[,7], probs = seq(0, 1, 0.25), na.rm = FALSE)
quantile(poblacion[,8], probs = seq(0, 1, 0.25), na.rm = FALSE)

#frecuencias
table(poblacion[,9])
table(poblacion[,10])

#2.5
correl <-function(i){
  correl <- numeric(ncol(poblacion))
  
  for(i in 2:ncol(poblacion)){
    if(is.numeric(poblacion[,i])==TRUE){
      correl[i] <- cor(poblacion[,2], poblacion[,i])
    }
    
  }
  datos<-data.frame(names(poblacion),correl)
  datos
}
correl(poblacion)

#2.6
#para aplicar t.test necesitamos las varianzas
v1<-poblacion[,2]
v2<-poblacion[,10]
#analizamos las varianzas
var(v1[v2=="SI"])
var(v1[v2=="NO"])
#se evidencia que son distintas, realizamos nuestra prueba de hipotesis
t.test(v1[v2=="SI"], v1[v2=="NO"],conf.level = 0.90)

#2.7
v2<-poblacion[,2]
v7<-poblacion[,7]
reg1<-lm(v1~v2+v7)
summary(reg1)
plot(reg1)
#el analisis ira en el informe

#2.8
#el analisis ira en el informe

#2.9
#usaremos graficos de dispersion para v1, v2 y v7
g <- ggplot(poblacion, aes(x=v1, y=v2))
g + geom_point() + geom_smooth(method="lm")

g <- ggplot(poblacion, aes(x=v1, y=v7))
g + geom_point() + geom_smooth(method="lm")

g <- ggplot(poblacion, aes(x=v2, y=v7))
g + geom_point() + geom_smooth(method="lm")

#usaremos graficos de normalidad para v1, v2 y v7
qqnorm(v1)
qqline(v1,col="red")

qqnorm(v2)
qqline(v2,col="red")

qqnorm(v7)
qqline(v7,col="red")
#usaremos histogramas para v1, v2 y v7
hist(v1)
hist(v2)
hist(v7)

#el analisis ira en el informe

#2.10
res1<- reg1$residuals
#comparemos los residuos con v1, v2 y v7
g <- ggplot(poblacion, aes(x=v1, y=res1))
g + geom_point() + geom_smooth(method="lm")

g <- ggplot(poblacion, aes(x=v2, y=res1))
g + geom_point() + geom_smooth(method="lm")

g <- ggplot(poblacion, aes(x=v7, y=res1))
g + geom_point() + geom_smooth(method="lm")

#ahora analicemos los residuos en funcion de los pronosticos del modelo
p1 <- reg1$fitted.values
plot(res1,p1)
#gracias al grafico podemos decir que requiere ajuste
vaj1<-log(v1)
vaj2<-log(v2)
vaj7<-log(v7)
reg2<-lm(vaj1~vaj2+vaj7)
summary(reg2)
plot(reg2)
#ahora vemos que el modelo se ajusta mejor a la linealidad que el modelo original
#ademas se puede aceptar el modelo de regresion multiple