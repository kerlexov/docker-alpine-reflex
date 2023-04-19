# Docker-alpine-reflex

An alpine container with reflex inside it to dev with docker

You can use this container to launch and auto-refresh your service in a container

## Build

```
$ docker build . -t itsalex/alpine-reflex:latest
```

## Live Reloading Command
```
docker exec -it CONTAINER_NAME reflex -r '\.go' -s -- sh -c 'go run main.go'
```


## License

[MIT](https://fr.wikipedia.org/wiki/Licence_MIT)
