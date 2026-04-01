#!/bin/bash

SERVICE_NAME=$1
RELEASE_VERSION=$2
USER_NAME=$3
EMAIL=$4

if [[ -z "${SERVICE_NAME}" || -z "${RELEASE_VERSION}" ]]; then
  echo "Usage: $0 <service_name> <release_version> <git_user_name> <git_email>"
  exit 1
fi

git config user.name "$USER_NAME"
git config user.email "$EMAIL"
git fetch --all && git checkout main

# Create output directory
mkdir -p pb/${SERVICE_NAME}

protoc --go_out=./pb --go_opt=paths=source_relative \
  --go-grpc_out=./pb --go-grpc_opt=paths=source_relative \
  ./${SERVICE_NAME}/*.proto
cd pb/${SERVICE_NAME}
go mod init \
  github.com/dangthanhduong01/microservices_proto/pb/${SERVICE_NAME} || true
go mod tidy
cd ../../
git add . && git commit -am "proto update" || true
git pull --rebase origin main || true
git push origin HEAD:main || true

# Delete and recreate tag to handle existing tags
git tag -d pb/${SERVICE_NAME}/${RELEASE_VERSION} 2>/dev/null || true
git tag -d pb/${SERVICE_NAME}/main 2>/dev/null || true
git push origin :refs/tags/pb/${SERVICE_NAME}/${RELEASE_VERSION} 2>/dev/null || true
git push origin :refs/tags/pb/${SERVICE_NAME}/main 2>/dev/null || true

git tag -fa pb/${SERVICE_NAME}/${RELEASE_VERSION} -m "pb/${SERVICE_NAME}/${RELEASE_VERSION}"
git tag -fa pb/${SERVICE_NAME}/main -m "pb/${SERVICE_NAME}/main"
git push origin refs/tags/pb/${SERVICE_NAME}/${RELEASE_VERSION}
git push origin refs/tags/pb/${SERVICE_NAME}/main
