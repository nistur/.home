#!/bin/bash

PKG=
DEPS=gcc

# try to identify which distro we're using, so we can
# guess at the correct package manager
if [ -f /etc/arch-release ] ; then
    PKG="pacman -Sy"
fi

if [ -z "${PKG}" ] ; then
    echo Unable to identify distro >&2
    exit -1
fi

# TODO: Add versions to the packages, then check first if the
# packages are already installed before adding them to the DEPS
# list
echo Updating required packages
sudo ${PKG} ${DEPS}
   
