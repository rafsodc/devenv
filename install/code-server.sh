#!/bin/bash
ARCH=$(dpkg --print-architecture)
CSVERSION="4.5.0"
CSDOWNLOAD="https://github.com/coder/code-server/releases/download/v${CSVERSION}/code-server_${CSVERSION}_${ARCH}.deb"
curl -fOL $CSDOWNLOAD
dpkg -i code-server_${CSVERSION}_${ARCH}.deb
systemctl enable code-server@ubuntu
systemctl start code-server@ubuntu
