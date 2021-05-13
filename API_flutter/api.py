from flask import Flask, request, jsonify
import joblib
import traceback
import pandas as pd
import numpy as np
import sys
from sklearn.preprocessing import StandardScaler

# Your API definition
app = Flask(__name__)

# input_data = [[1	, 1,	4	, 1,	0	, 3036,
# 2504,	158,	360	, 0.0,	1]	]


@ app.route('/', methods=['GET', 'POST'])
def predict():
    classifier = joblib.load("Loan Status Prediction.pkl")
    if classifier:

        try:
            # request.json['details':'details']

            # return jsonify({'who': details})
            input_data = request.json
            # print(json_)
            # query = pd.DataFrame(json_)

            input_data_as_numpy_array = np.asarray(input_data)
            input_data_reshaped = input_data_as_numpy_array.reshape(1, -1)

            print(input_data)

            prediction = (classifier.predict(input_data))

            # return jsonify({'prediction': str(prediction)})
            return jsonify({'prediction': str(prediction)})

        except:

            return jsonify({'trace': traceback.format_exc()})


if __name__ == '__main__':

    # return jsonify({'prediction': str(prediction)})

    try:
        port = int(sys.argv[1])  # This is for a command-line input
    except:
        port = 12345

    app.run(port=port, debug=True)
