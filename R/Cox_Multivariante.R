library(readxl)

##Diferentes conjuntos con todos los datos, los radiomicos y los clinicos, respectivamente
tcga <- read_excel("Cox_Todo.xlsx", col_names = TRUE)
#tcga <- read_excel("Cox_Rad.xlsx", col_names = TRUE)
#tcga <- read_excel("Cox_Clinico.xlsx", col_names = TRUE)

library(survival)

#Aplicacion de la regresion de Cox. El orden es formula es el siguiente: todos los datos, los radiomicos y los clinicos.
cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Maximum enhancement` + tcga$`Time to peak` + tcga$`Uptake rate` + tcga$`Washout rate` + tcga$`Curve shape index` + tcga$`Signal Enhancement Ratio (SER)` + tcga$`Enhancement-Variance Time to Peak` + tcga$`Enhancement-variance Increasing Rate` + tcga$`Difference Variance` + tcga$Energy + tcga$Homogeneity + tcga$IMC2 + tcga$`Sum Average` + tcga$`Sum Variance` + tcga$`Sum Entropy` + tcga$Variance + tcga$Sphericity + tcga$Irregularity + tcga$`Margin Sharpness` + tcga$`Variance of Radial Gradient Histogram`  + tcga$`Size/Lesion volume` + tcga$`Effective Diameter` + tcga$`Surface Area to Volume ratio` + tcga$`Volume of most enhancing voxels` + tcga$`Maximum Diameter` + tcga$Age + tcga$M + tcga$N + tcga$T + tcga$ER + tcga$Stage + tcga$PR + tcga$Procedure + tcga$HER2 + tcga$Margin + tcga$Lymphonodes, data = tcga)

#cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Maximum enhancement` + tcga$`Time to peak` + tcga$`Uptake rate` + tcga$`Washout rate` + tcga$`Curve shape index` + tcga$`Signal Enhancement Ratio (SER)` + tcga$`Enhancement-Variance Time to Peak` + tcga$`Enhancement-variance Increasing Rate` + tcga$`Difference Variance` + tcga$Energy + tcga$Homogeneity + tcga$IMC2 + tcga$`Sum Average` + tcga$`Sum Variance` + tcga$`Sum Entropy` + tcga$Variance + tcga$Sphericity + tcga$Irregularity + tcga$`Margin Sharpness` + tcga$`Variance of Radial Gradient Histogram`  + tcga$`Size/Lesion volume` + tcga$`Effective Diameter` + tcga$`Surface Area to Volume ratio` + tcga$`Volume of most enhancing voxels` + tcga$`Maximum Diameter`, data = tcga)

#cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$Age + tcga$M + tcga$N + tcga$T + tcga$ER + tcga$Stage + tcga$PR + tcga$Procedure + tcga$HER2 + tcga$Margin + tcga$Lymphonodes, data = tcga)

#Se sacan los resultados
summary(cox_model)

