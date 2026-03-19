#!/bin/dash
rsync -nvhiLruyPtz --stats $1 localhost:$2