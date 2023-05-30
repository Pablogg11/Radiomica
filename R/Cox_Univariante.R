library(readxl)
tcga <- read_excel("Cox_Rad.xlsx", col_names = TRUE)

library(survival)

##Aplicacion univariante de la regresion de Cox
cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Maximum enhancement`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Time to peak`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Uptake rate`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Washout rate`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Curve shape index`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Signal Enhancement Ratio (SER)`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Enhancement-Variance Time to Peak`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Enhancement-variance Increasing Rate`, data = tcga)
summary(cox_model)


cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Difference Variance`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$Energy, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$Homogeneity, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$IMC2, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Sum Average`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Sum Entropy`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Sum Variance`, data = tcga)
summary(cox_model)


cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$Variance, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$Sphericity, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$Irregularity, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Margin Sharpness`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Variance of Margin Sharpness`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Variance of Radial Gradient Histogram`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Size/Lesion volume`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Effective Diameter`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Surface Area to Volume ratio`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Volume of most enhancing voxels`, data = tcga)
summary(cox_model)

cox_model <- coxph(Surv(tcga$DFI, tcga$Recurrencia) ~ tcga$`Maximum Diameter`, data = tcga)
summary(cox_model)

