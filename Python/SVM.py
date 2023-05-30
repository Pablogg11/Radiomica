import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

from sklearn.model_selection import train_test_split
from sksurv.svm import FastSurvivalSVM, FastKernelSurvivalSVM

## Obtencion y preparacion de los datos 
df = pd.read_excel('Datos/TCGAE_Todo.xlsx')
#df = pd.read_excel('Datos/TCGAE_Rad.xlsx')
#df = pd.read_excel('Datos/TCGAE_Clinico.xlsx')

X = df.drop(['Recurrencia','DFI'],axis = 1)
y = df.loc[:,['Recurrencia', 'DFI']]

y = y.replace({0: False, 1: True})
y = y.to_records(index=False)

X = X.astype(np.float64)

rs = 15
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=rs)

## Entrenamiento mediante Support Vector Machines
fastSVM = FastSurvivalSVM(max_iter=1000, tol=1e-5, random_state=rs)
fastSVM.fit(X_train, y_train)

## Saca el C-index del modelo tras el entrenamiento y utilizando el conjunto de validacion
#print(round(fastSVM.score(X_test, y_test), 3))

## Entrenamiento mediante Support Vector Machines combinado con Kernel
fastKSVM = FastKernelSurvivalSVM(optimizer="rbtree", kernel="rbf", random_state=rs)
fastKSVM.fit(X_train, y_train)

## Saca el C-index del modelo tras el entrenamiento y utilizando el conjunto de validacion
#print(round(fastKSVM.score(X_test, y_test), 3))

## Calculo de la curva de supervivencia mediante el conjunto de validacion
fig, ax = plt.subplots()
ax.plot(fastKSVM.predict(X_test))
plt.ylim(-0.35, 0.35)

## Saca la grafica de la curva de supervivencia
#plt.show()

