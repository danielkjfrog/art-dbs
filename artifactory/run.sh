#!/usr/bin/env bash

DB_PROPERTIES=${ARTIFACTORY_HOME}/misc/db/${DB_TYPE}.properties
STORAGE_FILE=${ARTIFACTORY_HOME}/etc/storage.properties
TOMCAT_LIB=${ARTIFACTORY_HOME}/tomcat/lib
CONNECTOR_DOWNLOAD_URL=http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.38.tar.gz
CONNECTOR_FOLDER=`basename ${CONNECTOR_DOWNLOAD_URL} .tar.gz`

downloadAndPlaceMySqlConnector(){
    echo "Downloading MySQL Connector..."
    curl -L -o /tmp/${CONNECTOR_FOLDER}.tar.gz ${CONNECTOR_DOWNLOAD_URL}
    tar xvzf /tmp/${CONNECTOR_FOLDER}.tar.gz -C /tmp/
    echo "Placing Connector in TOMCAT folder..."
    cp /tmp/${CONNECTOR_FOLDER}/${CONNECTOR_FOLDER}-bin.jar ${TOMCAT_LIB}
}

prepareStorageProperties(){
    if [ ${DB_TYPE} ]; then
        echo "Creating storage.properties to ${DB_TYPE}..."
        sed s/localhost/${DB_TYPE}_db_container/ < ${DB_PROPERTIES} > ${STORAGE_FILE}
    fi
}

provideLicense(){
    echo "Saving Artifactory License..."
    curl -o ${ARTIFACTORY_HOME}/etc/artifactory.lic ${LIC_URL}
}

startArtifactory(){
    echo "Starting Artifactory as a service..."
    service artifactory wait
}

downloadAndPlaceMySqlConnector

prepareStorageProperties

provideLicense

startArtifactory