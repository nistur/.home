#!/bin/bash

# This is named badly, but it's just a place to build customised versions of
# some projects that I use, for deployment onto my computers. Specifically
# suckless' dwm, dmenu, st, and surf
scriptdir=$(dirname $(readlink -f "$0"))
projdir=${scriptdir}/projects
bindir=${scriptdir}/linkins/bin

# List of repositories to build
# TODO: Replace these with links to my own forks
# with my configuration applied
REPOS="https://git.suckless.org/dwm \
     https://git.suckless.org/dmenu \
     https://git.suckless.org/surf \
     https://git.suckless.org/st \
     https://git.suckless.org/slstatus"

if [ -d ${projdir} ] ; then
    rm -rf ${projdir}
fi

mkdir -p ${projdir}
mkdir -p ${bindir}

for repo in $REPOS ; do
    proj=$(basename $repo)
    git clone ${repo} --depth 1 ${projdir}/${proj}
    pushd ${projdir}/${proj}

    if [ -x configure ] ; then
	./configure
    fi

    #TODO: Allow for CMake builds?

    if [ -e Makefile ] ; then
	make
    fi

    # Link the compiled executable to the script's linkins bindir
    if [ -x ${proj} ] ; then
	ln -sf ${projdir}/${proj}/${proj} ${bindir}/${proj}
    fi
    # TODO: What if the executable isn't named ${proj} or is built to
    # a different location?
    
    popd
done

