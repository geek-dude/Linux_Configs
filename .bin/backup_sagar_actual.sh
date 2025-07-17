#!/bin/dash
function backup_sagar_actual()
{
    rsync -vhiLruyPtz --delete-delay --stats $1 sagar@10.107.104.23:./$2
}
