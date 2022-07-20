FROM node:current

# ARG is used here to make auto-update easy
ARG version=0.82.1

RUN npm install -g ibm-openapi-validator@${version}

RUN npm cache clean --force

WORKDIR /data

ENTRYPOINT ["lint-openapi"]
