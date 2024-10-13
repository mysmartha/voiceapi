FROM nvcr.io/nvidia/cuda:11.8.0-devel-ubuntu22.04 

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y python3 python3-pip libasound2 libcublas-12-6 libcudnn8-dev 
RUN pip3 config set global.index-url https://mirrors.aliyun.com/pypi/web/simple
RUN pip3 install sherpa-onnx==1.10.27+cuda -f https://k2-fsa.github.io/sherpa/onnx/cuda-cn.html

WORKDIR /app
ADD requirements.cuda.txt /app/
RUN pip3 install -r requirements.cuda.txt

ADD . /app/
ENTRYPOINT ["python3", "app.py"]
