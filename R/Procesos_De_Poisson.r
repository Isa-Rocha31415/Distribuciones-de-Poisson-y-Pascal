#library(plyr)

library(ggplot2)
library(plyr)
PoissonProcess<-function(t,lambda){
    N<-rpois(1,t*lambda)
    C<-sort(runif(N,0,t))
    data.frame(x=c(0,0,C),y=c(0,0:N))
}
NPois <- function(n, t, rate) {
    # Asegúrate de definir o corregir la función PoissonProcess
    C <- lapply(1:n, function(n) {
        data.frame(PoissonProcess(t, rate), simulacion = n)
    })
    
    # Usa ldply desde el paquete plyr
    C <- ldply(C, data.frame)
    C$simulacion <- factor(C$simulacion)
    
    # Sintaxis corregida de sprintf y dividida para respetar el límite de línea
    titulo <- sprintf("%5d Simulaciones del Proceso de Poisson de intensidad %.2f", 
                      n, rate)
    
    # Corregir la sintaxis de qplot
    qplot(x, y, data = C, geom = c("step", "point"), color = simulacion, 
          xlab = "Tiempo", ylab = "N(t)", main = titulo)
}
NPois(5,10,2)
# Definir explícitamente las variables globales x e y para evitar advertencias


# Asegúrate de cargar los paquetes necesarios
