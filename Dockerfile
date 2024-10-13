FROM docker.fxxk.dedyn.io/python:3.11.9-slim-bullseye 

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y python3 python3-pip libasound2 libcublas-12-6 libcudnn8-dev 
RUN pip3 config set global.index-url https://mirrors.aliyun.com/pypi/web/simple

WORKDIR /app
ADD requirements.cuda.txt /app/
RUN pip3 install -r requirements.txt

ADD . /app/
ENTRYPOINT ["python3", "app.py"]
