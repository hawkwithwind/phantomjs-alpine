#!/bin/bash

set -ex

# TODO: We don't actually need curl, but I couldn't figure out the appropriate
#       lib to add to include in the build so that internet connections work fine
dockerize -n -o dockerized-phantomjs \
          -e $(which phantomjs) \
          -a /bin/dash /bin/sh \
          -a /etc/fonts /etc  \
          -a /etc/ssl /etc  \
          -a /usr/share/fonts /usr/share  \
          --verbose \
          $(which phantomjs) \
          /usr/bin/curl

rm dockerized-phantomjs/Dockerfile

cd dockerized-phantomjs/ && \
tar --numeric-owner -zcf ../dockerized-phantomjs.tar.gz * && \
cd ..

rm -rf dockerized-phantomjs/

chown $(stat -c %u .):$(stat -c %g .) dockerized-phantomjs.tar.gz
