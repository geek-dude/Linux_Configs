#!/bin/dash
function show_dates
{
    ls -lat $1 | sed -n 's/.* \([A-Z][a-z][a-z] [(1-3) ][0-9].*\)/\1/p'
}
