#!/bin/bash
ARCH=$(dpkg --print-architecture)
CSVERSION="4.2.0"
CSDOWNLOAD="https://github.com/coder/code-server/releases/download/v${CSVERSION}/code-server_${CSVERSION}_${ARCH}.deb"
curl -fOL $CSDOWNLOAD
sudo dpkg -i code-server_${CSVERSION}_${ARCH}.deb
