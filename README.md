# docker-solid-server

Containerized version of node-solid-server

## How to use

For quickly check out this image or solid-server in general you can run:
```bash
docker run -p 8443:8443 aveltens/solid-server
```

This will use auto-generated self-signed certificates and is not suited for production use.

### Environment variables

All solid configuration flags can be set by an equivalent environment variable.
The official solid-server documentation
[explains them in detail](https://github.com/solid/node-solid-server#extra-flags-expert).

### Docker compose

For a productive setup you may want to use docker-compose. Example setups can be found
in the [examples folder](./examples). Here is an overview of what is in there:

#### Simple setup without proxy

`./examples/docker-compose.simple.yml`

Run solid-server directly on HTTPS port 443 without a proxy in between.
You will need to have your certificates ready and mount them into the container.

#### Running solid behind nginx proxy

Coming soon...

#### Other setups

The setup you need is not presented here? Feel free to ask, or provide a Pull Request
with your solution.

## Feedback & Discussion

There is a [topic in the Solid Forum](https://forum.solidproject.org/t/official-solid-docker-image/748/5),
you are welcome to join in.

## Contributing

If you would like to contribute to the development of this image,
see [CONTRIBUTING.md](./CONTRIBUTING.md)