import os
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'

if __name__ == '__main__':
    #Change this to false when on production
    port = int(os.environ.get("PORT", 5000))
    app.debug = True
    app.run("0.0.0.0", port)
