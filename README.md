The following commands will build images based on the current state of the ./src
directory.

Build and tag all images:
```
./build v3.0.0
```

Build and tag a specific image:
```
./build v3.0.0 api_base_image
```

Valid images for build command:
```
api_base_image
api_rails_image
api_cable_image
api_clockwork_image
api_sidekiq_image
client_image
proxy_image
```

Push images to Docker Hub
