#!/bin/bash
IMG_NAME="daniel-jozsef/parityplayground"
DATA_ROOT=${PWD}

# restore account keys from the backup folder
mkdir -p chainData/keys
cp -Rv config/keysBkup/* chainData/keys/

docker run \
  -p 8180:8180 -p 8545:8545 -p 8546:8546 -p 30303:30303 \
  -v $DATA_ROOT/chainData:/var/parity \
  -v $DATA_ROOT/config:/parity/config \
  -it $IMG_NAME
