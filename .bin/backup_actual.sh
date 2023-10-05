#!/bin/dash
function backup_actual()
{
    rsync -vhiLruyPtz --delete-delay --stats $1 localhost:$2
}
