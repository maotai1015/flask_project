from flask import Flask

from app.apis import api_

app = Flask(__name__)
app.register_blueprint(api_)

app.run(host="0.0.0.0", port=8082)
