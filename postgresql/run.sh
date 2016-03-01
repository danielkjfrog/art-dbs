#!/bin/bash

createArtifactoryUser(){
    psql -c "CREATE USER artifactory WITH PASSWORD 'password';CREATE DATABASE artifactory WITH OWNER=artifactory ENCODING='UTF8';GRANT ALL PRIVILEGES ON DATABASE artifactory TO artifactory;"
}

#createArtifactoryUser