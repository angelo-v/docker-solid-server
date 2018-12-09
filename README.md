# docker-solid-server

Containerized version of node-solid-server

## How to use

This is still work in progress and not meant to be used in production yet.

If you want to experiment with the image and/or contribute to its development,
please read the rest of this ReadMe.

## Run tests

```bash
make test
```

The first run might take a while, since the image has to be build. Follow up test runs will be faster.

## Start & stop locally

Build and run a local container named solid-server via

```bash
make start
```

and stop it via 

```bash
make stop
```

## Inspect & debug

To start a shell in a running container (started with `make start`) run `make attach`.

To just run a shell in the built image (without starting solid) run `make inspect`.

## Feedback & Discussion

There is a [topic in the Solid Forum](https://forum.solidproject.org/t/official-solid-docker-image/748/5),
you are welcome to join in.