#!/usr/bin/env bash

cd crawlers/brs-crawler \
  && rm -rf brs-crawler \
  && git clone https://github.com/gpedro34/brs-crawler \
  && cd ../utils-crawler \
  && rm -rf utils-crawler \
  && git clone https://github.com/gpedro34/utils-crawler \
  && cd ../../webservers/netx \
  && rm -rf burst-netx \
  && git clone https://github.com/gpedro34/burst-netx \
  && cd ../../webservers/front \
  && rm -rf burst-netx-ui \
  && git clone https://github.com/gpedro34/burst-netx-ui
