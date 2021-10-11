FROM node:16.9-alpine3.14

# ARG is used here to make auto-update easy
ARG version=0.51.3

RUN npm install -g ibm-openapi-validator@${version}

WORKDIR /data

ENTRYPOINT ["lint-openapi"]
