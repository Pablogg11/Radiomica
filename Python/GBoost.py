import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

from sklearn.model_selection import train_test_split
from sksurv.ensemble import GradientBoostingSurvivalAnalysis
from sksurv.ensemble import ComponentwiseGradientBoostingSurvivalAnalysis

## Obtencion y preparacion de los datos 
df = pd.read_excel('Datos/TCGAE_Todo.xlsx')
#df = pd.read_excel('Datos/TCGAE_Rad.xlsx')
#df = pd.read_excel('Datos/TCGAE_Clinico.xlsx')

X = df.drop(['Recurrencia','DFI'],axis = 1)
y = df.loc[:,['Recurrencia', 'DFI']]

y = y.replace({0: False, 1: True})
y = y.to_records(index=False)

rs = 15
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=rs)

## Entrenamiento mediante Gradient Boosting
est_cph_tree = GradientBoostingSurvivalAnalysis(loss = 'coxph', n_estimators=150, learning_rate=0.5, max_depth=1, random_state=rs)
est_cph_tree.fit(X_train, y_train)

## Saca el C-index del modelo tras el entrenamiento y utilizando el conjunto de validacion
#print(round(est_cph_tree.score(X_test, y_test), 3))

## Calculo de coeficientes del modelo
scores_cph_ls = {}
est_cph_ls = ComponentwiseGradientBoostingSurvivalAnalysis(learning_rate=1.0, random_state=0)
for i in range(1, 31):
    n_estimators = i * 10
    est_cph_ls.set_params(n_estimators=n_estimators)
    est_cph_ls.fit(X_train, y_train)
    scores_cph_ls[n_estimators] = est_cph_ls.score(X_test, y_test)

coef = pd.Series(est_cph_ls.coef_, ["Intercept"] + X_train.columns.tolist())

## Saca el numero de coeficientes que no son cero
#print("Number of non-zero coefficients:", (coef != 0).sum())
coef_nz = coef[coef != 0]
coef_order = coef_nz.abs().sort_values(ascending=False).index

## Saca los coeficientes que no son cero
#print(coef_nz.loc[coef_order])

## Calculo de la curva de supervivencia mediante el conjunto de validacion
surv_funcs = est_cph_tree.predict_survival_function(X_test)
for fn in surv_funcs:
     plt.step(fn.x, fn(fn.x), where="post")

plt.ylim(0, 1)

## Saca la grafica de la curva de supervivencia
#plt.show()