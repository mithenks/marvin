# Marvin 

[![Docker Build CI](https://github.com/mithenks/marvin/actions/workflows/docker-build.yaml/badge.svg)](https://github.com/mithenks/marvin/actions/workflows/docker-build.yaml)

Packages and technologies used:
 * [Micronaut Framework](https://micronaut.io/)
 * [picocli](https://picocli.info/)
 * [Docker](https://www.docker.com/)
 * [GraalVM](https://www.graalvm.org/)
 * [Native image](https://www.graalvm.org/reference-manual/native-image/)

## Package the CLI application

Run the docker container
```bash
$ ./go-in.sh
```

Package your application
```bash
[marvin-app@docker]:/usr/src/app$ mvn clean package -Dpackaging=native-image
```

You will find the runnable application in `app/target/marvin`.

## Notes

Here are some good-to-remember commands:
```
mvn org.owasp:dependency-check-maven:check
mvn versions:display-dependency-updates
mvn versions:display-plugin-updates
```