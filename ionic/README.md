# Ionic Framework

- Ubuntu 16.04
- NodeJS 8.0.0
- npm 5.0.0
- Ionic 3.3.0
- cordova 7.0.1

### Run
```
docker run \
  --rm \
  -ti \
  --privileged \
  -p 8100:8100 \
  -p 35729:35729 \
  -v /dev/bus/usb:/dev/bus/usb \
  -v ~/.gradle:/root/.gradle \
  -v $PWD:/app \
  stefanoschrs/ionic:latest \
  /bin/bash
```
