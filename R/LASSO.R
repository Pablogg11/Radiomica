library(readxl)
tcga <- read_excel("Cox_Rad.xlsx", col_names = TRUE)

library(glmnet)

##Preparacion de datos para su procesamiento, separamos DFI y Recurrencia (y)
tcga <- na.omit(tcga)
X <- tcga[3:28]
y <- tcga[,2]
y <- unlist(y)
y<-as.numeric(y)
X <- as.matrix(X)

##Aplicamos LASSO
cvfit <- cv.glmnet(X, y, alpha = 1)
best_lambda <- cvfit$lambda.min
fit_best <- glmnet(X, y, alpha = 1, lambda = best_lambda)

##Se sacan los coeficientes calculados por LASSO
coef(fit_best)
