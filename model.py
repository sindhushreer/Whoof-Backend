import pandas as pd
from sklearn.tree import DecisionTreeRegressor
from sklearn.metrics import confusion_matrix
df = pd.read_csv('Dataset.csv')
X = df.drop(columns=['RiskPercentage','Health'])
print(X)
y = df[['RiskPercentage','Health']]

from sklearn.model_selection import train_test_split
X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=0.2,random_state=2)
#train the model

dt = DecisionTreeRegressor()
dt.fit(X_train,y_train)
y_pred = dt.predict(X_test)
#save the model in pickle format
import pickle 
pickle.dump(dt,open('Classifier.pkl','wb'))