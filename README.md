# ElectrumX servers in containers

A collection of scripts we use to build and run ElectrumX servers in containers
using Docker or Podman.

Env variables that never change are defined in `ENV` section of container files.
The rest like the `COIN` and `NET` is expected to be set from command line
or a script. For example, BTC mainnet is run like so:

    podman run --name btc1 --rm --net=host \
      -v /path/to/host/data:/data \
      -e COIN=BitcoinSegwit \
      -e NET=mainnet \
      <image-name> \
      /usr/local/bin/electrumx_server
