#!/bin/bash
set -e

if [ "$POSTGRES_USER" == "postgres" ]
then
    echo "creating a backup as the postgres user is not supported, make sure to set the POSTGRES_USER environment variable"
    exit 1
fi

export PGPASSWORD=$POSTGRES_PASSWORD

echo "creating backup"
echo "---------------"

FILENAME=backup_$(date +'%Y_%m_%dT%H_%M_%S').sql
pg_dump -h postgres -U $POSTGRES_USER >> /backups/$FILENAME

echo "successfully created backup $FILENAME"
