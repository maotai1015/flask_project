from flask import Blueprint
from flask_restful import Api, Resource
api_bp = Blueprint("v1", __name__, url_prefix="/v1")
api = Api(api_bp)


def hs():
    print("2222")
    return "hello! zjx"


print("123")

