FROM node:current-alpine3.16

WORKDIR /data

# ARG is used here to make auto-update easy
ARG version=0.96.1

RUN npm install -g ibm-openapi-validator@${version}

RUN npm cache clean --force

ENTRYPOINT ["lint-openapi"]
