###-----------------------------------------------###
###----------- Curso R Nivel Básico --------------###
###-- Lectura y Escritura de datos en R ----------###
###-- Source Stat Lab Ec -------------------------###
###-- Mayo, 2015 ---------------------------------###
###-----------------------------------------------###


path1 <- file.path("D:", "caro semestre 2015-A","modelos_lineales","trabajo en r","curso R","R-Nivel-Basico","read_data",fsep = .Platform$file.sep)

str(.Platform)
.Platform$file.sep


file.path("D:", "caro semestre 2015-A","modelos_lineales","trabajo en r","curso R","R-Nivel-Basico","read_data","data.xlsx",fsep=.Platform$file.sep)

getwd() #me muestra dnde estoy trabajando
list.files() #enlista los archivos de mi directorio de trabajo

setwd(path1) #cambio la direccion del directorio
list.files() 
getwd()


#cambio de direccion otra vez a la inicial R nivel Basico
path2 <- file.path("D:", "caro semestre 2015-A","modelos_lineales","trabajo en r","curso R","R-Nivel-Basico",fsep = .Platform$file.sep)
setwd(path2)
list.files()
getwd()


##--------- 1. working directory wd
# setear wd
wd0 <- "D:/caro semestre 2015-A/modelos_lineales/trabajo en r/curso R/R-Nivel-Basico"
wd0
setwd(dir = wd0)
getwd()
list.files()

wd1 <- "D:/caro semestre 2015-A/modelos_lineales/trabajo en r/curso R/R-Nivel-Basico/read_data" 
wd1
setwd(dir = wd1)
getwd()
list.files()

# archivos en wd
list.files()
list.files(pattern = ".txt") #me enlista solo los archivos de .txt

files <- list.files()
files
grep(files, pattern = ".txt") #muestra las componentes en donde tengo .txt
files[grep(files,pattern = ".txt")] #extraigo el nombre de ese vector, uso el CORCHETE

# crear nuevos directorios
setwd(dir = wd0) #cambio nuevamente de directorio
file.exists("ssl") #para ver si existe un carpeta con ese nombre
dir.create("ssl") #ahora si creo esa carpeta con ese nombre

##--------- 2. read files
setwd(wd1)
list.files()

# read.table function
# archivo formato txt
data_txt1 <- read.table(file = "data_read.txt",sep = "\t", dec = ",", header = TRUE)
str(data_txt1)
View(data_txt1)
attributes(data_txt1)

names(data_txt1)
class(data_txt1)
dim(data_txt1)
ncol(data_txt1)
nrow(data_txt1)

summary(data_txt1)


data_txt <- read.table(file = "data.txt",sep = "\t", dec = ",", header = TRUE, stringsAsFactors = FALSE)
str(data_txt)
View(data_txt)
attributes(data_txt)

names(data_txt)
class(data_txt)
dim(data_txt)
ncol(data_txt)
nrow(data_txt)

summary(data_txt)

# Variables categóricas como character
data_txt2 <- read.table(file = "data_read.txt",sep = "\t", dec = ",",
                        header = TRUE, stringsAsFactors = FALSE)
str(data_txt2)


# archivo formato csv
data_csv <- read.table(file = "data_read.csv",sep = ",", dec = ".", header = TRUE)
str(data_csv)
View(data_csv)

names(data_csv)
class(data_csv)
dim(data_csv)
ncol(data_csv)
nrow(data_csv)

summary(data_csv)

typeof(data_csv[,5]) #accede a toda la columna 5 

mean(data_csv[,"Edad"]) #media de la Edad


#otra forma de leer la data.csv
data_csv <- read.csv(file = "data_read.csv")
str(data_csv)

# sep = ",", dec = ".", header=TRUE
data_csv1 <- read.csv(file = "data_read.csv")
str(data_csv1)

data_csv2 <- read.csv2(file = "data_read.csv",sep = ",", dec = ".", header = TRUE)
str(data_csv2)


# archivo formato xlsx
install.packages("readxl", dependencies = TRUE)
library(readxl)
ls("package:readxl")

# lista de las hojas del libro "data_read.xlsx"
excel_sheets(path = file.path(wd1, "data_read.xlsx")) #al directorio wd1 le añade el archivo data_read.xlsx

excel_sheets(path = file.path(wd1, "data.xlsx"))

data_xlsx <- read_excel("data_read.xlsx",sheet = "datos",col_names = TRUE, na=c(""))
str(data_xlsx)
View(data_xlsx)
typeof(data_xlsx[,2]) #tipo de la columna 2

# archivos spss formato .sav
install.packages("foreign", dependencies = TRUE)
library(foreign)
ls("package:foreign")

data_sav1 <- read.spss("data_read.sav", use.value.labels = TRUE, 
                       to.data.frame = TRUE)
str(data_sav1)


install.packages("haven", dependencies = TRUE)
# spss: read_spss(), sas: read_sas(), stata: read_dta()
library(haven)
ls("package:haven")
data_sav2 <- read_spss("data_read.sav")
str(data_sav2)

##--------- Comparación foreign y haven:
# foreign
system.time(data_sav1 <- read.spss("data_read.sav", use.value.labels = TRUE, 
                                   to.data.frame = TRUE)) #tiempo que tardo en correr la data
# haven
system.time(data_sav2 <- read_spss("data_read.sav"))




##--------- Accediendo a datos desde la web
## Descargar archivos desde Dropbox
install.packages("repmis", dependencies = TRUE, destdir="D:/caro semestre 2015-A/modelos_lineales/trabajo en r/curso R")
install.packages("chron", dependencies = TRUE, destdir="D:/caro semestre 2015-A/modelos_lineales/trabajo en r/curso R")
library(repmis)
ls("package:repmis")

data_dbx <- source_DropboxData(file = "grafo.txt", key="iiaakx3agz5x3va", sep=" ",
                               header = TRUE) #bajo un archivo desde dropbox

str(data_dbx)


## Descargar archivos desde tablas html
library(RCurl)
library(XML)
install.packages("RCurl", dependencies = TRUE, destdir="D:/caro semestre 2015-A/modelos_lineales/trabajo en r/curso R"))
install.packages("XML", dependencies = TRUE, destdir="D:/caro semestre 2015-A/modelos_lineales/trabajo en r/curso R"))
# http://www.sbs.gob.ec/practg/sbs_index?vp_art_id=&vp_tip=6&vp_buscr=/practg/pk_cons_bdd.p_bal_entdd_finnc
cod_inst<-1011
cod_mes<-12
cod_anio<-2014
paste("Curso", "R", "Basico", 1, sep="")
base_url <- paste('http://www.sbs.gob.ec/practg/pk_cons_bdd.p_bal_entdd_finnc?vp_cod_tip_instt=3&vp_cod_instt=',
                  cod_inst,'&vp_anio=', cod_anio, '&vp_mes=', cod_mes, '&vp_cod_tip_catlg=14')
table_url <- readHTMLTable(base_url)
str(table_url)
data_sbs <- table_url[[3]]
str(data_sbs)
View(data_sbs)



##--------- 3. Manipulacion Informacion
# lea el archivo en formato txt data.txt
# asigne el archivo de datos a la variable data_txt
setwd(wd1)
list.files()

data_txt <- read.table(file = "data.txt",sep = "\t", dec = ",", header = TRUE)
# que estructura de datos es data_txt
str(data_txt)
View(data_txt)

# Muestre los nombres, clase, dimension, numero de col, numero de filas de data_txt 
names(data_txt)
class(data_txt)
dim(data_txt)
dim(data_txt)[1]
dim(data_txt)[2]
ncol(data_txt)
nrow(data_txt)

summary(data_txt1) #saca estadisticos de las variables

# Ingresando a los elementos de la data

#---------------------------- Variable numerica ---------------------
edad <- data_txt[,2] #estoy guardando la columna de edades 
edad <- data_txt[,"Edad"]
str(edad)
View(edad)
typeof(edad)
length(edad)
attributes(edad)
class(edad)

is.atomic(edad)
is.integer(edad)
is.double(edad)
is.numeric(edad)
is.list(edad)

names(data_txt)
antigued <- data_txt[,21]
antig <- data_txt[,"Antiguedad"]
str(antig)
View(antig)
typeof(antig)
length(antig)
attributes(antig)
class(antig)

is.atomic(antig)
is.integer(antig)
is.double(antig)
is.numeric(antig)
is.list(antig)

antig[10]



# obtener los elementos 5, 8, 10 de edad y asignar a edad1
edad1 <- edad[c(5,8,10)]
edad1
length(edad1)

#extraer la posicion 20 y 30 de la variable edad
edad[20]
edad[30]
edad[c(20,30)]

# obtener los 50 primeros elementos de edad y asignar a edad1
edad1 <- edad[1:50]
edad1
length(edad1)

# eliminar el primer elemento de edad y asignar a edad1
edad1 <- edad-1
edad1
length(edad)
length(edad1)

edad3 <- edad-c(1:5)
edad3


# eliminar los elementos 1, 25, 51 de edad y asignar a edad1
edad1 <- edad[-c(1,25,51)]
length(edad)
length(edad1)

# eliminar los primeros 1000 elementos de edad y asignar a edad1
edad1 <- edad[-(1:1000)]
length(edad)
length(edad1)

# eliminar los elementos iguales a 24 de edad y asignar a edad1
edad==24
edad1 <- edad[edad==24]
# edad1 es constante? siii
min(edad1)==max(edad1) #como el minimo de edad es igual al maximo TRUE es CONSTANTE
length(edad1)

edad==30
edad4 <- edad[edad==30]
View(edad4)
# edad4 es constante? siii
min(edad4)==max(edad4)
length(edad4)

#edad distinta de 24
edad!=24
!edad==24
edad5 <- edad[edad!=24]
edad5
length(edad5)
mean(edad5)
min(edad5)
max(edad5)
summary(edad5)

#edad distinta de 30
edad!=30
!edad==30
edad6 <- edad[edad!=30]
edad6
length(edad6)
mean(edad6)
min(edad6)
max(edad6)
summary(edad6)

# Seleccionar los valores inferiores a 65 años asignar a edad1
edad<=65
edad65 <- edad[edad<=65]
length(edad65)
mean(edad65)
min(edad65)
max(edad65)
summary(edad65)

# recodificando valores
# si la edad es superior a 65 setear 65 por defecto
#estoy cambiando los datos a los que tengan mayor que 65 se asignan 65
edad>65
edad1 <- edad
edad1[edad1>65] <- 65
max(edad1)
max(edad)
View(edad1)

# si la edad es inferior a 18 setear 18 por defecto
#estoy cambiando los datos a los que tengan menos que 18 se asignan 18
edad1 <- edad
edad1[edad1<18] <- 18
min(edad1)
min(edad)
View(edad1)

# si la edad es inferior a 18 y mayor a 65 setear "fuera de rango" por defecto
edad1 <- edad
edad1<18 | edad > 65
edad1[edad1<18 | edad > 65] <- "fuera de rango"
View(edad1)
str(edad1)
min(edad1)
max(edad1)
# obtener la media?
mean(edad1)
edad2 <- as.numeric(edad1)
#edad2 <- as.double(edad1)
#edad2 <- as.integer(edad1)
mean(edad2)
mean(edad2, na.rm=TRUE)