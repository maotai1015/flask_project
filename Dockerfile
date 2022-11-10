FROM python:3.6-alpine

ENV APP_NAME=myproject \
    APP_PORT=8082 

COPY . /home/${APP_NAME}/flask_project
WORKDIR /home/${APP_NAME}/flask_project

RUN apk update && apk upgrade \
    && apk add -U tzdata ca-certificates \
    && apk add --no-cache --virtual .build-deps gcc g++ libffi-dev musl-dev libc-dev zlib-dev jpeg-dev freetype-dev \
    && apk add net-snmp \
    && apk add --no-cache --no-progress openssh redis \
    && pip install --no-cache-dir -r ./requirements.txt \
    && apk del .build-deps
# RUN yum install gcc python36-devel

EXPOSE 22
EXPOSE ${APP_PORT}

CMD ["uwsgi","uwsgi.ini"]
# CMD ["flask","run"]