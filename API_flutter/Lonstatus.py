import sys
import traceback
from flask import Flask, request, jsonify
import joblib
from sklearn import svm
from sklearn import *
from sklearn.ensemble import ExtraTreesClassifier
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, f1_score, precision_score, recall_score
loan_dataset = pd.read_csv("Loan_dataset.csv")
# Impute missing values for Gender
loan_dataset['Gender'].fillna(loan_dataset['Gender'].mode()[0], inplace=True)
# Impute missing values for Married
loan_dataset['Married'].fillna(loan_dataset['Married'].mode()[0], inplace=True)

# Impute missing values for Self_Employed
loan_dataset['Self_Employed'].fillna(
    loan_dataset['Self_Employed'].mode()[0], inplace=True)

# Impute missing values for Dependents
loan_dataset['Dependents'].fillna(
    loan_dataset['Dependents'].mode()[0], inplace=True)

# Impute missing values for Creditability
loan_dataset['Creditability'].fillna(
    loan_dataset['Creditability'].mode()[0], inplace=True)

# Impute missing values for LoanAmount
loan_dataset['LoanAmount'] = loan_dataset['LoanAmount'].fillna(
    loan_dataset['LoanAmount'].mean())

# Impute missing values for Loan_Amount_Term
loan_dataset['Loan_Amount_Term'] = loan_dataset['Loan_Amount_Term'].fillna(
    loan_dataset['Loan_Amount_Term'].mean())
# label encoding
loan_dataset.replace({"Loan_Status": {'N': 0, 'Y': 1}}, inplace=True)
loan_dataset = loan_dataset.replace(to_replace='3+', value=4)
loan_dataset.replace({'Married': {'No': 0, 'Yes': 1}, 'Gender': {'Male': 1, 'Female': 0}, 'Self_Employed': {'No': 0, 'Yes': 1},
                      'Property_Area': {'Rural': 0, 'Semiurban': 1, 'Urban': 2}, 'Education': {'Graduate': 1, 'Not Graduate': 0}}, inplace=True)
loan_dataset.drop('Loan_ID', axis=1, inplace=True)
X = loan_dataset.drop(columns=['Loan_Status'], axis=1)
Y = loan_dataset['Loan_Status']

scaler = StandardScaler()
scaler.fit(X)
standardized_data = scaler.transform(X)
X = standardized_data
Y = loan_dataset['Loan_Status']
X_train, X_test, Y_train, Y_test = train_test_split(
    X, Y, test_size=0.2, stratify=Y, random_state=2)


classifier = svm.SVC(kernel='linear')
classifier.fit(X_train, Y_train)


joblib.dump(classifier, "Loan Status Prediction.pkl")
classifier = joblib.load("Loan Status Prediction.pkl")


#input_data = (1	, 1,	4	, 1,	0	, 3036,	2504.0,	158.000000,	360.0	, 0.0,	1)
"""
input_data_as_numpy_array = np.asarray(input_data)
input_data_reshaped = input_data_as_numpy_array.reshape(1, -1)
std_data = scaler.transform(input_data_reshaped)
prediction = classifier.predict(std_data)
print(prediction)
"""

# Your API definition
app = Flask(__name__)


@ app.route('/loan', methods=['POST', 'GET'])
def predict():

    # request.json['details':'details']

    # return jsonify({'who': details})
    input_data = request.get_json()
    #  'Gender': intgen,
    #       'Married': intmarr,
    #       'Dependents': intdep,
    #       'Education': intedulevel,
    #       'ApplicantIncome': intinc,
    #       'CoapplicantIncome': intcoinc,
    #       'LoanAmount': intloanamt,
    #       'Loan_Amount_Term': intloandur,
    #       'Creditability': credit,
    #       'Property_Area': 2,
    #intaccbal = input_data.get('Account Balance')
    intgen = input_data.get('Gender')
    intmarr = input_data.get('Married')
    intdep = input_data.get('Dependents')
    intedulevel = input_data.get('Education')
    intinc = input_data.get('ApplicantIncome')
    intcoinc = input_data.get('CoapplicantIncome')
    intloanamt = input_data.get('LoanAmount')
    intloandur = input_data.get('Loan_Amount_Term')
    credit = input_data.get('Creditability')

    datapassed = (intgen, intmarr, intdep, intedulevel, intinc, intcoinc,
                  intloanamt, intloandur, credit, 2)

    input_data_as_numpy_array = np.asarray(datapassed)
    input_data_reshaped = input_data_as_numpy_array.reshape(1, -1)
    std_data = scaler.transform(input_data_reshaped)
    prediction = classifier.predict(std_data)
    # return jsonify({'prediction': str(prediction)})
    return jsonify({'prediction': str(prediction)})

    # return jsonify({'trace': traceback.format_exc()})


if __name__ == '__main__':

    # return jsonify({'prediction': str(prediction)})
    classifier = joblib.load("Loan Status Prediction.pkl")

    try:
        port = int(sys.argv[1])  # This is for a command-line input
    except:
        port = 3001

    app.run(port=port, debug=True)
