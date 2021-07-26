FROM node:15.14-alpine3.13

# ARG is used here to make auto-update easy
ARG version=0.46.4

RUN npm install -g ibm-openapi-validator@${version}

WORKDIR /data

ENTRYPOINT ["lint-openapi"]
