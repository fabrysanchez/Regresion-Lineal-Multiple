search()
install.packages("devtools", dependencies = TRUE)
install.packages('readxl', dependencies=TRUE) #permite leer archivos desde excel
devtools::install_github("rstudio/rmarkdown")
library("devtools")#sirve para hacer uso o cargar el paquete para usar las funciones
library('translate2R')
require('translate2R')
install.packages("foreign", dependencies = TRUE)#para leer archivos de varios programas(spss,stat, etc)
ls('package:foreign')#ls: para saber todas las funciones que tiene el paquete
ls('package:readxl')
library("readxl")
ls('package:readxl')
lsf.str('package:readxl')#lsf.str: saber las funciones y los parametros que requiere c/u
install.packages("installr", dependencies = TRUE)
ls('package:installr')
library(installr)
rnorm(10)#observaciones de una normal en forma aleatoria
getwd()#muestra el directorio en donde estamos trabajando
dir.create('clase1')#crea una carpeta en el directorio donde estamos trabajando
setwd('C:/Users/Crystal3/Desktop/Fabry (R)/R-Nivel-Basico')#para cambiar de directorio para trabajar
