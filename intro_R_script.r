
getwd()
setwd("/media/evolucion/akodon/clases/genpop/")

# instalando... 

install.packages("ggplot2")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")            # paso previo!

BiocManager::install("LEA")

install.packages("devtools")  # paso previo!
devtools::install_github("EvolEcolGroup/tidypopgen")

# funciones... argumentos...
seq(from = 1, to = 7, by = 2) # genera una secuencia numérica con pasos de 2

# equivalente a...
num <- seq(1,7,2) # aca estamos omitiendo los argumentos

# aclaracion breve, pipas, pipes
# aclaración para usar %>% necesitas instalar otros paquetes, 
# library(dplyr) o library(magritrr)
c("a", "b", "c")
head(num)

c("a", "b", "c") %>% head(1)
c("a", "b", "c") |> head(1) # esta es la pipa en base R!

# código equivalente
c("a", "b", "c") %>% as.data.frame() %>%  write.csv("vectorcito.csv")
write.csv(as.data.frame(c("a", "b", "c")), "vectorcito.csv")
          
# tipos de objetos 
Incognita <-c(FALSE,TRUE)
Incognita
class(Incognita) # ¿Qué tipo de clase es este objeto?

# textos o strings
Bio <- c("Andes","Amazonas", "Cerrado", "Patagonia","Paramo")
class(Bio)

#operaciones básicas
Bio[3]
Bio[c(2,3)]  # equivalente> Bio[2:3]
Bio[-c(2,3)]

# sobreescribiendo... 
Bio <- Bio[-4] # prestar atencion a la sobreescritura
Bio

# VECTOR & vector con nombres... 
x<-1:5
class(x)
names(Bio) <- x
Bio   # named vector o vector con nombres

# FACTORES
mf <- c("Norte","Sur","Sur","Norte","Sur")
mf <- factor(mf)
mf # prestar atención a los niveles
          
# MATRICES
M <- matrix(1:15,3,5)
M
# M <- matrix(sample(letters,12),3,4)
M[2,4] # fila,columna, siempre ese orden
M[2,]  # FILA
M[,4]  # COLUMNA
class(M[,4])
class(M[2,4])
class(M)

Clado <- M[2,] # segunda fila...

# DATA.FRAME, DATAFRAMES
DF <- data.frame(Bio,Clado,x)
names(DF)
colnames(DF) # colnames y names son funciones similares...
class(DF)

DF$Bio
DF$Clado

class(DF$Bio) # un vector...

# seleccionar fila 1, col 2 
DF[1, 2]

#seleccionar toda fila y dos columnas “Bio” y “x”
DF[, c("Bio" , "x")]

# seleccionar por posición
DF[[1]] # 1° columna


DF$Bio[1] # primer elemento, columna 1

#seleccionar por nombre de columna
DF$x

DF1 <- data.frame(DF$Bio,DF$x)

colnames(DF1) <- c("Biomas", "total")

# fusionamos 
colbind <- as.data.frame(cbind(Bio,Clado))  # fusionar columnas
rowbind <-  rbind(Bio,Clado)                # fusionar filas

# una lista... 
UnaLista <- list(mf,1:2,DF)
class(UnaLista)
UnaLista


# leyendo datos...
vroom
read_delim
read_csv
read_tsv

library(tidyverse)
library(readr)
mtcarsREAD <- read_csv(readr_example("mtcars.csv"))

# library(vroom)
# mtcarsREAD <- vroom(readr_example("mtcars.csv"))

library(readxl)
read_xlsx(readxl_example("datasets.xlsx"))
