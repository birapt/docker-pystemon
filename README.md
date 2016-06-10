# docker-pystemon

## Build image

```
cd <your path>/docker-pystemon
docker build -t docker-pystemon .
```

## Run image
```
docker run -d --name pystemon -v <your path/alerts>:/servers/pystemon/alerts docker-pystemon
```
