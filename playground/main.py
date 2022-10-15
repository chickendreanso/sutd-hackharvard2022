from flask import Flask, request, jsonify
from flask_cors import CORS
import json
import ast
from data import filter_data 


app = Flask(__name__)
CORS(app)

@app.route('/')
def index():
    return "HackHavard 2022 :D!"

@app.route('/filter', methods=['GET'])
def filter():
    args = request.args
    # data = request.get_json() 
    print(args.items())
    p = args['person']
    print(p)
    output= filter_data(p = int(p))
    return output


if __name__ == "__main__": 
    app.run(debug=True)