FROM python:3.8

ENV APP_NAME = myproject \
    APP_PORT = 8081 

COPY . /home/${APP_NAME}/flask_test
WORKDIR /home/${APP_NAME}/flask_test

RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# RUN yum install gcc python36-devel

EXPOSE 22
EXPOSE ${APP_PORT}

# CMD ["uwsgi","uwsgi.ini"]
CMD ["flask","run"]