set.seed(018) # Para reproducibilidad

# Numero de observaciones

n <- 20

# Generar horas de estudio (entre 1 y 10)
Horas_Estudio <- sample(1:10, n, replace = TRUE)

# Asignar probabilidad de aprobar en funcion de horas de estudio
# A más horas, más alta la probabilidad
Resultado <- sapply(Horas_Estudio, function(horas) {
  ifelse(runif(1) < (horas / 10), "Aprobado", "Reprobado")
})

# crear data frame
estudio <- data.frame(
  Estudiante = 1:n,
  Horas_Estudio,
  Resultado
)


# Crear variable dicotonómica: 1 = Aprobado, 0 = Reprobado
estudio$Res_bin <- ifelse(estudio$Resultado == "Aprobado", 1, 0)
head(estudio)

cor.test(estudio$Horas_Estudio, estudio$Res_bin, method = "pearson")

