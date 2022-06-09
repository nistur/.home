#!/bin/bash

this=$(readlink -f $0)
dir=$(dirname ${this})

chosen=$(find ${dir} -type f \( -name '*.jpg' -o -name '*.png' \) -print0 | shuf -n1 -z)

feh --bg-center "${chosen}" &
