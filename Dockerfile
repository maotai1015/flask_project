FROM python:3.8
COPY . /home/flask_test
WORKDIR /home/flask_test

RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple


EXPOSE 22
EXPOSE 8081

CMD ["uwsgi","uwsgi.ini"]