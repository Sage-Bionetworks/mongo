# NLP Sandbox MongoDB image

[![Docker Pulls](https://img.shields.io/docker/pulls/nlpsandbox/mongo.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/nlpsandbox/mongo)
[![GitHub Release](https://img.shields.io/github/release/nlpsandbox/mongo.svg?include_prereleases&color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/nlpsandbox/mongo/releases)
[![GitHub CI](https://img.shields.io/github/workflow/status/nlpsandbox/mongo/ci.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/nlpsandbox/mongo)
[![GitHub License](https://img.shields.io/github/license/nlpsandbox/mongo.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/nlpsandbox/mongo)

Hardened MongoDB Docker image

## Specification

- Modify the entrypoint script to create a DB user at startup using the values
  of the environment variables `${MONGO_USERNAME}` and `${MONGO_PASSWORD}`. It
  is recommended for better security to use this user rather than MongoDB
  default user .
