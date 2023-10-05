#!/bin/dash
function search_all()
{
    find $1 -iname "$2"
    # For reg expression search comment above and uncomment below
    #find $1 -regex "$2"
}
