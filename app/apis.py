from flask import Blueprint

api_ = Blueprint("v1", __name__, url_prefix="/v1")

import redis

redis_pool = redis.ConnectionPool(host='127.0.0.1', port= 6379, db= 0)
redis_conn = redis.Redis(connection_pool= redis_pool)

@api_.route("/hs")
def sum():
    return "ok!xing"


@api_.route("/add")
def add_num():
    res = redis_conn.incr("total")
    return str(res)

@api_.route("/get")
def get_num():
    res = redis_conn.get("total")
    if not res:
        res = "None"
    return res

@api_.route("/del")
def del_num():
    res = redis_conn.decr("total")
    return str(res)

