FROM node:current-alpine3.16

# ARG is used here to make auto-update easy
ARG version=0.88.2

RUN npm install -g ibm-openapi-validator@${version}

RUN npm cache clean --force

WORKDIR /data

ENTRYPOINT ["lint-openapi"]
