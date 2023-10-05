#!/bin/dash
function list_sizes()
{
    echo 'Regular files and folders:'
    du -sch $1*
    echo -e '\nHidden files and folders:'
    du -sch $1.[!.]* 2>/dev/null
}
