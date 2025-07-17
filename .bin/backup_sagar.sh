#!/bin/dash
function backup_sagar()
{
    rsync -nvhiLruyPtz --delete-delay --stats $1 sagar@10.107.104.23:./$2
}
