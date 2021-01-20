# MongoDB image

[![Docker Pulls](https://img.shields.io/docker/pulls/nlpsandbox/mongo.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/nlpsandbox/mongo)
[![GitHub Release](https://img.shields.io/github/release/nlpsandbox/mongo.svg?include_prereleases&color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/nlpsandbox/mongo/releases)
[![GitHub CI](https://img.shields.io/github/workflow/status/nlpsandbox/mongo/ci.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/nlpsandbox/mongo)
[![GitHub License](https://img.shields.io/github/license/nlpsandbox/mongo.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/nlpsandbox/mongo)

Hardened MongoDB Docker image

## Specification

For better security, the entrypoint script is modified to provide an alternative
to Mongo's default database and user.

This container

- creates a database named according to the environment variable
  `${MONGO_INITDB_DATABASE}`
- create a DB user at startup using the values of the environment variables
  `${MONGO_USERNAME}` and `${MONGO_PASSWORD}`
