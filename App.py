from flask import Flask, request, jsonify
import numpy as np  # Example: assuming you're using a model that requires numpy
from sklearn.externals import joblib  # Example: assuming you're using scikit-learn for your model

app = Flask(__name__)

# Load your trained model
model = joblib.load('your_trained_model.pkl')  # Replace 'your_trained_model.pkl' with your actual trained model file

@app.route('/predict', methods=['POST'])
def predict():
    # Get input data from the request
    data = request.json
    
    # Preprocess input data if necessary
    # Example: Convert input data to numpy array if needed
    input_data = np.array(data['input'])
    
    # Make predictions using the trained model
    prediction = model.predict(input_data)
    
    # Return the prediction as JSON
    return jsonify({'prediction': prediction.tolist()})

if __name__ == '__main__':
    app.run(debug=True)
