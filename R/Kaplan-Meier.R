library(readxl)

##Conjuntos de entrenamiento con datos clinicos y Radiomics Score de LASSO/Elastic Net
tcga <- read_excel("KM_LASSO.xlsx", col_names = TRUE)
#tcga <- read_excel("KM_EN.xlsx", col_names = TRUE)

##Conjuntos de validacion con datos clinicos y Radiomics Score de LASSO/Elastic Net
#tcga <- read_excel("KM_LASSO_V.xlsx", col_names = TRUE)
#tcga <- read_excel("KM_EN_V.xlsx", col_names = TRUE)


library(survival)

##Se calcula las curvas de supervivencia mediante Kaplan-Meier
surv <- Surv(tcga$DFI, tcga$Recurrencia)
curvaKM <- survfit(surv ~ 1, data = tcga, type = "kaplan-meier") 

##Se saca la grafica de las curvas de supervivencia
plot(curvaKM, xlab = "Tiempo", ylab = "Probabilidad de supervivencia")
