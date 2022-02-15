FROM node:17.2-alpine3.14

# ARG is used here to make auto-update easy
ARG version=0.56.1

RUN npm install -g ibm-openapi-validator@${version}

WORKDIR /data

ENTRYPOINT ["lint-openapi"]
