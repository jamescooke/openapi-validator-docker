FROM node:16.9-alpine3.14

# ARG is used here to make auto-update easy
ARG version=0.47.0

RUN npm install -g ibm-openapi-validator@${version}

WORKDIR /data

ENTRYPOINT ["lint-openapi"]
