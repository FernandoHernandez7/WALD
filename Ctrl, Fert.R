# Pruebas de T

calidad <- read.csv("ejemplo_2.csv", header = T)
View(calidad)

calidad$Tratamiento <- as.factor(calidad$Tratamiento)

hist(subset(calidad$IE, calidad$Tratamiento == "ctrl"))
hist(subset(calidad$IE, calidad$Tratamiento == "Fert"))

boxplot(calidad$IE ~ calidad$Tratamiento,
        xlab = "Nivel de factor",
        ylab = "Frecuencia",
        col = "red")
# separar los niveles de factor

Ctrl <- (subset(calidad$IE,calidad$Tratamiento == "Ctrl"))
Fert <- (subset(calidad$IE,calidad$Tratamiento != "Ctrl"))


shapiro.test(Ctrl)
shapiro.test(Fert)


bartlett.test(calidad$IE ~ calidad$Tratamiento)

t.test(calidad$IE ~ calidad$Tratamiento, var.equal = T)