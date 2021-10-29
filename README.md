# Marvin 

Packages and technologies used:
 * [Micronaut Framework](https://micronaut.io/)
 * [picocli](https://picocli.info/)
 * [Docker](https://www.docker.com/)
 * [GraalVM](https://www.graalvm.org/)
 * [Native image](https://www.graalvm.org/reference-manual/native-image/)

This project uses [bmeme/mn-dev](https://hub.docker.com/r/bmeme/mn-dev) image from [BMEME](https://www.bmeme.com).

## Package the CLI application

Run the docker container
```bash
$ docker-compose up -d
```

Package your application
```bash
$ ./cmvn clean compile test package
```

You will find the runnable application in `app/target/marvin`.
