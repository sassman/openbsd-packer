#!/bin/sh
#
# Install the ports system

set -ex

cd /tmp
ftp $MIRROR/pub/OpenBSD/$(uname -r)/{ports.tar.gz,SHA256.sig}
signify -Cp /etc/signify/openbsd-$(uname -r | cut -c 1,3)-base.pub -x SHA256.sig ports.tar.gz

cd /usr
tar xzf /tmp/ports.tar.gz

rm -f /tmp/{ports.tar.gz,SHA256.sig}
