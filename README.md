## Artifactory-Databases Composition

#### Supported databases:
- MySQL
- Oracle DB
- Postgres

#### Required Environment Variables:
Environment Variables must to be provided in *./artifactory/common.env*
- ARTIFACTORY_USER -> REPO21 user
- ARTIFACTORY_PASSWORD -> REPO21 password
- ARTIFACTORY_VERSION -> Artifactory version for containers
- ARTIFACTORY_HOME -> /var/opt/jfrog/artifactory (DEFAULT)
- LIC_URL -> Url for downloading license file

#### Running compositions:

Instructions for installing Docker Compose can be found at  [https://docs.docker.com/compose/install/]

Each database have its own *docker-compose.yml* and can be built in combination with Artifactory.

A generic *docker-compose.yml* can be found in the root of the project, which build one Artifactory instance for each database using different ports (8081, 8082, 8083).

##### Inside *docker-compose.yml* directory:

Build composition:
```
docker-compose build
```

Run composition:
```
docker-compose up
```
