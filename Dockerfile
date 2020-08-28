FROM node:13-alpine

# ARG is used here to make auto-update easy
ARG version=0.29.2

RUN npm install -g ibm-openapi-validator@${version}

WORKDIR /data

ENTRYPOINT ["lint-openapi"]
