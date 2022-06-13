FROM node:18.3-alpine3.15

# ARG is used here to make auto-update easy
ARG version=0.81.0

RUN npm install -g ibm-openapi-validator@${version}

WORKDIR /data

ENTRYPOINT ["lint-openapi"]
