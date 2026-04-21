# JFHH
# 14/04/2026
# Datos Climatológicos
# Cumbres NL, Villagran Tamps, Carranza Coahuila
library(lubridate)
clima <- read.csv("climatologia.csv", header =T)
clima$Localidad <- as.factor(clima$Localidad)
clima$Fecha <- as.Date(clima$Fecha, format = "%d/%m/%Y")
clima$fechaHora <- as.POSIXct(paste(clima$Fecha, clima$Hora),
                              format = "%Y-%m-%d %H:%M:%S")

cumbres <- subset(clima,Localidad =="cumbres")
cumbres <- cumbres[order(cumbres$fechaHora),]

plot(cumbres$fechaHora, cumbres$TEMP,
     type = "l",
     col = "indianred",
     lwd = 2,
     xlab = "Fecha",
     ylab = "Temp (°C)",
     main = "Serie de tiempo variable Temp")
