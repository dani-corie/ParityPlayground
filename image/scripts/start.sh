#!/bin/sh

if [ -f ${CONFIGDIR}/sealer.txt ]; then
  echo "Sealer key in {config}/sealer.txt. Starting sealer node."

  if [ ! -f ${CONFIGDIR}/sealer_pass.txt ]; then
    echo "Sealer account password not found in {config}/sealer_pass.txt."
    echo "Aborting."
    exit 1
  fi

  ${PARITY} --chain "${CONFIGDIR}/chain.json" \
    --base-path ${DATADIR} \
    --jsonrpc-apis web3,eth,net,personal,parity,parity_set,traces,rpc,parity_accounts \
    --unsafe-expose \
    --usd-per-tx 0 \
    --password ${CONFIGDIR}/sealer_pass.txt \
    --engine-signer `cat ${CONFIGDIR}/sealer.txt` \
    --reseal-on-txs "none"

else
  echo "{config}/sealer.txt not found. Starting observer node."

  ${PARITY} --chain "${CONFIGDIR}/chain.json" \
    --base-path ${DATADIR} \
    --jsonrpc-apis web3,eth,net,personal,parity,parity_set,traces,rpc,parity_accounts \
    --unsafe-expose

fi
