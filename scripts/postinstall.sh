#!/bin/sh

set -ex

uname_r=`uname -r`

export PKG_PATH="$MIRROR/pub/OpenBSD/$uname_r/packages/`arch -s`/"

# set pkg path for users
echo "export PKG_PATH=\"$PKG_PATH\"" >> /root/.profile