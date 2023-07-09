FROM node:current-alpine

# ARG is used here to make auto-update easy
ARG version=1.1.2

RUN npm install -g ibm-openapi-validator@${version}

RUN npm cache clean --force

WORKDIR /data

ENTRYPOINT ["lint-openapi"]
