from sklearn.linear_model import LogisticRegression
import numpy as np
import sys
import traceback
from flask import Flask, request, jsonify
import joblib
from sklearn import svm
from sklearn import *
from sklearn.ensemble import ExtraTreesClassifier

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, f1_score, precision_score, recall_score
credit_dataset = pd.read_csv("Credit_dataset.csv")
X = credit_dataset.drop(columns=['Creditability'], axis=1)
Y = credit_dataset['Creditability']
model = ExtraTreesClassifier()
model.fit(X, Y)
scaler = StandardScaler()
scaler.fit(X)
standardized_data = scaler.transform(X)
print(standardized_data)
X = standardized_data
Y = credit_dataset['Creditability']
X_train, X_test, Y_train, Y_test = train_test_split(
    X, Y, test_size=0.3, stratify=Y, random_state=2)
model1 = LogisticRegression()
model1.fit(X_train, Y_train)
y_predict1 = model1.predict(X_test)

joblib.dump(model1, "Creditability.pkl")
model = joblib.load("Creditability.pkl")


app = Flask(__name__)


@ app.route('/credit', methods=['POST', 'GET'])
def predict():

    # request.json['details':'details']

    # return jsonify({'who': details})
    input_data = request.json
    # print(input_data)
    #query = pd.DataFrame(json_)

    #input_data = (1	, 24	, 2,	1987	, 1,	3,	21,	3	, 1,	1	, 2	,	2)
    input_data_as_numpy_array = np.asarray(input_data)
    input_data_reshaped = input_data_as_numpy_array.reshape(1, -1)
    std_data = scaler.transform(input_data_reshaped)
    prediction = model1.predict(std_data)
    # return jsonify({'prediction': str(prediction)})
    return jsonify({'prediction': str(prediction)})

    # return jsonify({'trace': traceback.format_exc()})


if __name__ == '__main__':

    # return jsonify({'prediction': str(prediction)})
    model = joblib.load("Creditability.pkl")

    try:
        port = int(sys.argv[1])  # This is for a command-line input
    except:
        port = 8000
    app.run(port=port, debug=True)
