FROM node:13.7.0-alpine

ARG version=0.15.1

RUN npm install -g ibm-openapi-validator@${version}

ENTRYPOINT ["lint-openapi"]
