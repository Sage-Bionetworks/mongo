FROM mongo:4.4.5

# Safer bash script execution
SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

# Update default docker-entrypoint.sh to add non-root user to the database
# named following the value of the official environment variable
# MONGO_INITDB_DATABASE.
COPY add-db-user /tmp/
RUN sed '/export MONGO_INITDB_DATABASE/ r /tmp/add-db-user' \
    /usr/local/bin/docker-entrypoint.sh -i