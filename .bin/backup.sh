#!/bin/dash
function backup()
{
    rsync -nvhiLruyPtz --delete-delay --stats $1 localhost:$2
}
