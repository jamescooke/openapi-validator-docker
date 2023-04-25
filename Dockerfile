FROM node:current-alpine3.17

# ARG is used here to make auto-update easy
ARG version=1.0.4

RUN npm install -g ibm-openapi-validator@${version}

RUN npm cache clean --force

WORKDIR /data

ENTRYPOINT ["lint-openapi"]
