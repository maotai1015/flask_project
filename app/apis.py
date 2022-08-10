from flask import Blueprint

api_ = Blueprint("v1", __name__, url_prefix="/v1")


@api_.route("/hello")
def sum():
    return "hello kkkk"


