FROM python:3.6

ENV APP_NAME=myproject \
    APP_PORT=8082 

COPY . /home/${APP_NAME}/flask_project
WORKDIR /home/${APP_NAME}/flask_project

RUN apt-get update && apt-get install -y snmp
RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# RUN yum install gcc python36-devel

EXPOSE 22
EXPOSE ${APP_PORT}

CMD ["uwsgi","uwsgi.ini"]
# CMD ["flask","run"]