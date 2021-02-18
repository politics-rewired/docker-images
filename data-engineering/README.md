# data eng prep


Running:

```sh
docker run  \
  gcr.io/assemble-services/data-engineering:latest
```

Building:

```
docker build . -t gcr.io/assemble-services/data-engineering:$(git rev-parse HEAD)
docker tag gcr.io/assemble-services/data-engineering:$(git rev-parse HEAD) gcr.io/assemble-services/data-engineering:latest
docker push gcr.io/assemble-services/data-engineering
```
