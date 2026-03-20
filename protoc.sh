#!/bin/bash

SERVICE_NAME=$1
RELEASE_VERSION=$2
USER_NAME=$3
EMAIL=$4

git config user.name "$USER_NAME"
git config user.email "$EMAIL"
git fetch --all && git checkout main

# sudo apt-get install -y protobuf-compiler golang-goprotobuf-dev
# go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
# go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
protoc --go_out=./pb --go_opt=paths=source_relative \
  --go-grpc_out=./pb --go-grpc_opt=paths=source_relative \
 ./${SERVICE_NAME}/*.proto
cd pb/${SERVICE_NAME}
go mod init \
  github.com/dangthanhduong01/microservices_proto/pb/${SERVICE_NAME} || true
go mod tidy
cd ../../
git add . && git commit -am "proto update" || true
git push origin HEAD:main
git tag -fa pb/${SERVICE_NAME}/${RELEASE_VERSION} \
  -m "pb/${SERVICE_NAME}/${RELEASE_VERSION}" 
git push origin refs/tags/pb/${SERVICE_NAME}/${RELEASE_VERSION}