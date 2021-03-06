# terra-docker

Docker-compose for Terra LCD node

Start by `cp default.env .env` and set the `NODE_NAME`. Optionally adjust `QUICKSYNC_MIRROR`.

`COMPOSE_FILE` determines which yml files to use, see below for some options.

This repo assumes columbus-5 mainnet, and configures variables as per Terra [node instructions](https://docs.terra.money/How-to/Run-a-full-Terra-node/).
It uses cleveldb for performance, instead of the default goleveldb.

It assumes you are running traefik to expose the LCD port 1317 via https://. You'll want to firewall access to 443.

You can expose these ports instead via `lcd-shared.yml` and `rpc-shared.yml`. Caution with both of those, they need to be firewalled.

`traefik-cf.yml`, `traefik-aws.yml` and `ext-network.yml` are all different ways of running / hooking into traefik.

The prometheus metrics port can be exposed with `metrics-shared.yml`. Typically it'd stay inside docker, and be scraped from a prometheus in a shared
docker network.

To start, run `docker-compose up -d`. To update terrad, run `docker-compose build --no-cache`, followed by
`docker-compose down && docker-compose up -d`.

Note that snapshot download takes ~ 1 hour. Do not stop the container while it is doing initial setup. If you
do stop it, it'll start the download over when it gets started again.

[Traefik instructions](https://eth-docker.net/docs/Usage/ReverseProxy) and instructions to [configure ufw](https://eth-docker.net/docs/Support/Cloud) so it's "in the path" of Docker.

`terra-haproxy.cfg` is a sample haproxy configuration file. `check-terrasync.sh` verifies sync status for haproxy. `haproxy-docker-sample.yml` is an example for a docker-compose file running haproxy, inside a docker swarm mode.
