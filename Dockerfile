FROM node:13.7.0-alpine

RUN npm install -g ibm-openapi-validator@0.15.1

ENTRYPOINT ["lint-openapi"]
