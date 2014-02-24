#!/bin/sh
cat style.css local.css | csstidy - --template=highest --optimise_shorthands=2 --remove_last_\;=true combined.min.css
