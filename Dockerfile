FROM golang

RUN apt-get update && apt-get install -y \
    wget \
    unzip

RUN wget https://github.com/google/protobuf/releases/download/v3.3.0/protoc-3.3.0-linux-x86_64.zip &&\
    unzip protoc-3.3.0-linux-x86_64.zip -d protoc &&\
    mv protoc/bin/protoc /usr/bin &&\
    rm protoc-3.3.0-linux-x86_64.zip &&\
    rm -r protoc/

RUN go get -u github.com/golang/protobuf/protoc-gen-go

WORKDIR /home
ENTRYPOINT ["protoc"]
