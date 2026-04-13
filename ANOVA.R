# Jose Fernando Hernandez Herrera
# 13/04/2026

#ANOVA

localidad <- read.csv("Datos_Rascon_ANOVA.csv", header =T)
 View(localidad)

 localidad$Paraje <- as.factor(localidad$Paraje)
 
 boxplot(localidad$DAP ~ localidad$Paraje,
         xlab = "Paraje",
         ylab = "DBH (cm)",
         col = "lightgreen")
# Normalidad de datos DBH o DAP
 
 shapiro.test(localidad$DAP)

# revisar a profundidad los datos de DAP
 
 hist(localidad$DAP)

 mean(localidad$EDAD) 

 localidad$logDAP <- log10(localidad$DAP) 
 localidad$sqrDAP <- sqrt(localidad$DAP)
hist(localidad$logDAP) 
hist(localidad$sqrDAP)
shapiro.test(localidad$logDAP)
shapiro.test(localidad$sqrDAP)

bartlett.test(localidad$sqrDAP ~ localidad$Paraje)

# se cumplen la normalidad y homogenidad de varianzas de la variable transformada por raiz cuadrada (sqrt)

# Procedo a realizar el ANOVA con sqrDAP
# función aov

paraje.aov <- aov(localidad$sqrDAP ~ localidad$Paraje)

summary(paraje.aov)

TukeyHSD(paraje.aov)
plot(TukeyHSD(paraje.aov))
