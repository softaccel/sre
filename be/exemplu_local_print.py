from flask import Flask, request
from flask_restful import Api
from flask_cors import CORS, cross_origin
import os

app = Flask(__name__)
api = Api(app)
CORS(app, support_credentials=True)

@app.route('/print_label/<label>', methods = ['PUT'])
def print_label(label):
    f = open("label.zpl", "w")
    f.write(label)
    f.close()
    bashComm = "./print_script.sh"
    os.system(bashComm)
    return "1"

if __name__ == '__main__':
    app.run(debug = True, host='0.0.0.0')
