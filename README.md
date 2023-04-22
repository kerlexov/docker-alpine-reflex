# Docker-alpine-reflex

An alpine container with reflex inside it to dev with docker. With or without golang.

You can use this container to launch and auto-refresh your service in a container.

Docker images:

- [itsalex/alpine-reflex](https://hub.docker.com/r/itsalex/alpine-reflex)
- [itsalex/alpine-reflex-with-golang](https://hub.docker.com/r/itsalex/alpine-reflex-with-golang)

## Build

Without golang:

```sh
$ docker build . -t itsalex/alpine-reflex
```

With golang:

```sh
$ docker build -f golang.Dockerfile . -t itsalex/alpine-reflex-with-golang
```

## How to use

You can use it for example to watch binary:

```sh
docker exec -it itsalex/alpine-reflex reflex -r '/usr/bin/custom_binary' -s -- sh -c '/usr/bin/custom_binary'
```

Or to watch golang files:

```sh
docker exec -it itsalex/alpine-reflex-with-golang:1.20.3-alpine3.17 reflex -r '\.go' -s -- sh -c 'go run main.go'
```


## License

[MIT](https://fr.wikipedia.org/wiki/Licence_MIT)
