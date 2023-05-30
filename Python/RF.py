import pandas as pd
import matplotlib.pyplot as plt

from sklearn.model_selection import train_test_split
from sksurv.ensemble import RandomSurvivalForest
from sklearn.inspection import permutation_importance

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

## Entrenamiento mediante Random Forest
rsf = RandomSurvivalForest(n_estimators=1000, min_samples_split=10, min_samples_leaf=15, n_jobs=-1, random_state=rs)
rsf.fit(X_train, y_train)

## Saca el C-index del modelo tras el entrenamiento y utilizando el conjunto de validacion
print(rsf.score(X_test, y_test))

## Calculo de coeficientes del modelo
result = permutation_importance(rsf, X_test, y_test, n_repeats=15, random_state=rs)
data = pd.DataFrame({k: result[k] for k in ("importances_mean", "importances_std",)}
                    ,index=X_test.columns).sort_values(by="importances_mean", ascending=False)

## Saca los datos de los coeficientes 
#print(data)

## Calculo de la curva de supervivencia mediante el conjunto de validacion
surv = rsf.predict_survival_function(X_test, return_array=True)
for i, s in enumerate(surv):
     plt.step(rsf.event_times_, s, where="post", label=str(i))
     plt.ylabel("Probabilidad de supervivencia")
     plt.xlabel("Tiempo")
     plt.grid(True)

## Saca la grafica de la curva de supervivencia
#plt.show()
