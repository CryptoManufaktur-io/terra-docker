#!/bin/bash
if [ ! -f /var/lib/terra/setupdone ]; then
  terrad --home /var/lib/terra init ${NODE_NAME}
  dasel put string -f /var/lib/terra/config/app.toml minimum-gas-prices "0.01133uluna,0.15uusd,0.104938usdr,169.77ukrw,428.571umnt,0.125ueur,0.98ucny,16.37ujpy,0.11ugbp,10.88uinr,0.19ucad,0.14uchf,0.19uaud,0.2usgd,4.62uthb,1.25usek,1.25unok,0.9udkk,2180.0uidr,7.6uphp,1.17uhkd"
  dasel put bool -f /var/lib/terra/config/app.toml api.enable true
  wget https://columbus-genesis.s3.ap-northeast-1.amazonaws.com/columbus-5-genesis.json -O /var/lib/terra/config/genesis.json
  wget https://network.terra.dev/addrbook.json -O /var/lib/terra/config/addrbook.json
  if [ ! -z ${QUICKSYNC_URL} ]; then
    wget ${QUICKSYNC_URL} -O /var/lib/terra/quicksync.tar.lz4
    tar zvf /var/lib/terra/quicksync.tar.lz4 -I lz4 -C /var/lib/terra/data
    rm /var/lib/terra/quicksync.tar.lz4
  fi
  touch /var/lib/terra/setupdone
fi

exec "@"
