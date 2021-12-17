# terra-docker

Docker-compose for Terra LCD node

Start by `cp default.env .env` and set the `NODE_NAME`. Also adjust the `QUICKSYNC_URL`. You'll likely want a "default"
snapshot here, not "pruned" or "archive".

This repo assumes columbus-5 mainnet, and configures variables as per Terra [node instructions](https://docs.terra.money/How-to/Run-a-full-Terra-node/).

It assumes you are running traefik to expose the LCD port 1317 via https://. You'll want to firewall access to 443.

To start, run `docker-compose up -d`. To update terrad, run `docker-compose build --no-cache`, followed by
`docker-compose down && docker-compose up -d`.
