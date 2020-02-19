![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/jamescooke/openapi-validator)
![Docker Pulls](https://img.shields.io/docker/pulls/jamescooke/openapi-validator)


# Docker container for IBM OpenAPI Validator

This is a small community Docker container wrapper around [IBM's
OpenAPI Validator](https://github.com/IBM/openapi-validator/).

## Run

* To validate a specification file `openapi.yaml` in the current directory,
  mount the current directory at `/data` in the container (this is the image's
  default working directory):

  ```sh
  $ docker run \
       --volume "$PWD":/data \
       jamescooke/openapi-validator openapi.yaml
  ```

* The `init` command can be used to generate the initial `.validaterc` file,
  which will be created in the mounted directory.

  ```sh
  $ docker run \
       --volume "$PWD":/data \
       jamescooke/openapi-validator init
  ```

  You may need to adjust the permissions of the generated file.

* If you prefer to rename your config file, for example to `config.json`, then
  this can be passed with the `--config` flag:

  ```sh
  $ docker run \
       --volume "$PWD":/data \
       jamescooke/openapi-validator openapi.yaml --config config.json
  ```

## Container

* This is a "small-ish" container built on [Node 13
  Alpine](https://hub.docker.com/_/node/) base image.

* OpenAPI validator is installed in the container using `npm`.

* Image tags are kept synchronised with the version of OpenAPI validator. For
  example, image `0.21.0` contains [OpenAPI validator version
  `0.21.0`](https://github.com/IBM/openapi-validator/releases/tag/v0.21.0):

  ```sh
  $ docker run jamescooke/openapi-validator:0.21.0 --version
  0.21.0
  ```

## Links

* OpenAPI Validator:
    [repository](https://github.com/IBM/openapi-validator/),
    [releases](https://github.com/IBM/openapi-validator/releases)

* Docker container: [docker
    hub](https://hub.docker.com/r/jamescooke/openapi-validator)

## Thanks

* [Dustin](https://github.com/dpopp07) and the IBM team for their hard work on
    the OpenAPI Validator tool.

* [Martins](https://github.com/martinsirbe) and my
    [Lucid](https://github.com/lucidhq) teammates for all their help with
    Docker and containers.
