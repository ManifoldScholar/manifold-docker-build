# Manifold Docker Build

There are currently two organizations setup on Docker hub: `manifoldscholar` and `manifoldscholarship`.

We're currently using `manifoldscholar` for our live, production Docker images. The other organization, `manifoldscholarship` is currently being used for our in-progress Docker images that are being build for our kubernetes setup. At some point, we'll want to cut over to one or the other.

- Images are built from the current source in `./manifold-src`

# Building and Pushing Images

Build the API dev image:
```
docker build --no-cache --build-arg MANIFOLD_VERSION=v6.0.0-development.1 -t manifoldscholarship/manifold-api-dev:v6.0.0-development.1 -f ./dockerfiles/manifold-api-dev/Dockerfile .
```

Build the API:
```
docker build --no-cache --build-arg MANIFOLD_VERSION=v5.1.4-beta.1 -t manifoldscholar/manifold-api:v5.1.4-beta.1 -f ./dockerfiles/manifold-api/Dockerfile .
```

Build the Client:
```
docker build --no-cache --build-arg MANIFOLD_VERSION=v5.1.4-beta.1 -t manifoldscholar/manifold-client:v5.1.4-beta.1 -f ./dockerfiles/manifold-client/Dockerfile .
```

Build the Nginx Proxy:
```
docker build --no-cache --build-arg MANIFOLD_VERSION=v5.1.4-beta.1 -t manifoldscholar/manifold-nginx:v5.1.4-beta.1 -f ./dockerfiles/manifold-nginx/Dockerfile .
```



Push the API:
```
docker push manifoldscholar/manifold-api:v5.1.4-beta.1
```

Push the client
```
docker push manifoldscholar/manifold-client:v5.1.4-beta.1
```

Push the Nginx proxy
```
docker push manifoldscholar/manifold-nginx:v5.1.4-beta.1
```
