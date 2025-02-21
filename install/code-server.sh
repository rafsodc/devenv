#!/bin/bash
ARCH=$(dpkg --print-architecture)
CSVERSION="4.14.1"
CSDOWNLOAD="https://github.com/coder/code-server/releases/download/v${CSVERSION}/code-server_${CSVERSION}_${ARCH}.deb"
curl -fOL $CSDOWNLOAD
dpkg -i code-server_${CSVERSION}_${ARCH}.deb
systemctl enable code-server@ubuntu
systemctl start code-server@ubuntu
rm code-server_${CSVERSION}_${ARCH}.deb
