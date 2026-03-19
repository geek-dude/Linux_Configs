#!/bin/dash
rsync -vhiLruyPtz --stats $1 localhost:$2