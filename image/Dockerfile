# Ethereum playground for private networks
#
FROM parity/parity:stable

ENV PARITY="/parity/parity" \
    DATADIR="/var/parity" \
    CONFIGDIR="/parity/config"

WORKDIR /parity

ADD ./ /parity/
RUN chmod +x /parity/scripts/*.sh

ENTRYPOINT ["/parity/scripts/start.sh"]
