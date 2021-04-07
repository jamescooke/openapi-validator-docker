FROM node:14.11.0-alpine3.12

# ARG is used here to make auto-update easy
ARG version=0.40.1

RUN npm install -g ibm-openapi-validator@${version}

WORKDIR /data

ENTRYPOINT ["lint-openapi"]
