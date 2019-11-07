# Print headers NodeJS application

Small NodeJS rest application that prints request headers to the console (std out).

This application is for testing purposes and is used in development.

Can be also taken as an example project that uses typescript and multistage docker build.

## Usage

Check the "Makefile" for most common commands

## Build

Builds an image with the name "netum/print-headers-nodejs:latest"
```
make
```

## Build version
Build an image with the name "netum/print-headers-nodejs:1.0"
```
make VERSION=1.0
```

## Build with registry prefix
Build an image with the name "<registry_name>/netum/print-headers-nodejs:1.0"
```
make REGISTRY=<registry_name>/ VERSION=1.0
```