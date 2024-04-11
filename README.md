# Marvin 

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
[marvin-app@docker]:/usr/src/app$ mvn clean package
```

You will find the runnable application in `app/target/marvin`.
