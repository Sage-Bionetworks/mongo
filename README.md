# MongoDB image

[![GitHub Release](https://img.shields.io/github/release/Sage-Bionetworks/mongo.svg?include_prereleases&color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/Sage-Bionetworks/mongo/releases)
[![GitHub CI](https://img.shields.io/github/workflow/status/Sage-Bionetworks/mongo/ci.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/Sage-Bionetworks/mongo/actions)
[![GitHub License](https://img.shields.io/github/license/Sage-Bionetworks/mongo.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/Sage-Bionetworks/mongo/blob/main/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/sagebionetworks/mongo.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/sagebionetworks/mongo)

Hardened MongoDB Docker image

## Specification

This image extends the official [mongo image](https://hub.docker.com/_/mongo)
to provide the features described below.

### Create non-root user at startup

By default, a user connects to the DB using the root account specified by
the credentials defined by the following official environment variables

- `MONGO_INITDB_ROOT_USERNAME`
- `MONGO_INITDB_ROOT_PASSWORD`

as shown in this official example:

```console
docker run -d --network some-network --name some-mongo \
    -e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
    -e MONGO_INITDB_ROOT_PASSWORD=secret \
    sagebionetworks/mongo
```

**Issue:** This root account has elevated priviledges that allow it to perform any actions
in the DB. In practice, you may prefer to restrict the priviledges that your
application has access to for better security.

**Solution:** When a container is started for the first time it will execute the
script [add-db-user](add-db-user) that creates a user account with priviledges
limited to the role [dbAdmin]. This role does not grant privileges for user
and role management. Moreover, this user access is limited to the use of a
single database specified by the official environment variable
`MONGO_INITDB_DATABASE`. This user account is created only if the environment
variables listed below are specified:

- `MONGO_USERNAME`
- `MONGO_PASSWORD`

Example:

```console
docker run -d --network some-network --name some-mongo \
    -e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
    -e MONGO_INITDB_ROOT_PASSWORD=secret \
    -e MONGO_INITDB_DATABASE=appdb \
    -e MONGO_USERNAME=appuser \
    -e MONGO_PASSWORD=secret \
    sagebionetworks/mongo
```

## Contributing

Anyone can contribute with [issues] and [PRs]. If you're submitting a pull
request, always create a new branch to work your changes, and try squashing
commits down if possible.

<!-- Links -->

[mongo image]: https://hub.docker.com/_/mongo
[dbAdmin]: https://docs.mongodb.com/manual/reference/built-in-roles/#dbAdmin
[sagebionetworks/mongo]: https://hub.docker.com/repository/docker/sagebionetworks/mongo
[issues]: https://github.com/Sage-Bionetworks/mongo/issues
[PRs]:https://github.com/Sage-Bionetworks/mongo/pulls