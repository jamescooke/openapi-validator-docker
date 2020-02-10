FROM node:13.7.0-alpine

# ARG is used here to make auto-update easy
ARG version=0.18.0

RUN npm install -g ibm-openapi-validator@${version}

ENTRYPOINT ["lint-openapi"]
