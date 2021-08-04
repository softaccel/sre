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


"""
let obj = create_label("nu da in jos ca nu rupi de loc. ui ce proasta-i. asa mi-a luat si mie Matei", "D12345678", "A420", "1234567", "7654321", 22)
 $.ajax({
        url: "http://127.0.0.1:5000/print_label/"+obj.label,
        type: "PUT",
        crossDomain: true,
        headers: {  'Access-Control-Allow-Origin': "http://127." },
        success: function(data){
            console.log("mere");
        },
        error: function() {
            console.log("nu gata")}
    });
"""
