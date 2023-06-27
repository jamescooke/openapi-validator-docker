FROM node:current-alpine3.18

# ARG is used here to make auto-update easy
ARG version=1.1.2

RUN apk update && apk add --upgrade libcrypto3 libssl3

RUN npm install -g ibm-openapi-validator@${version}

RUN npm cache clean --force

WORKDIR /data

ENTRYPOINT ["lint-openapi"]
