from flask import Flask, request
from flask_cors import CORS

from model import get_model


app = Flask(__name__)
CORS(app)

@app.route('/')
def index():
    return "HackHavard 2022 :D!"

@app.route('/summarise', methods=['GET'])
def summarise():
    args = request.args
    # data = request.get_json() 
    print(args.items())
    dia = args['dialogue']
    print(dia)
    output= get_model(dialogue = dia)
    return output


if __name__ == "__main__": 
    app.run(debug=True)