#!/bin/dash
function search()
{
    find $1 -mount -iname "$2"
    # For reg expression search comment above and uncomment below
    #find $1 -mount -regex "$2"
}
