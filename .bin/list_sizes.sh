#!/bin/dash

# Colors
RED='\033[0;31m'
GREEN_BOLD='\033[1;32m'
BLUE_BOLD='\033[1;36m'
NC='\033[0;39m'

# Default to current directory if no argument
DIR="${1:-.}"

printf "${GREEN_BOLD}Regular files and folders:${NC}\n"

set -- "$DIR"/*

if [ -e "$1" ]; then
    du -sch "$@" 2>/dev/null | sed 's|\(\S\+\s\+\).*/|\1|'
else
    printf "${RED}No regular files found${NC}\n"
fi
du -sch "$DIR"/* 2>/dev/null | sed 's|\(\S\+\s\+\).*/|\1|'

printf "\n${GREEN_BOLD}Hidden files and folders:${NC}\n"

set -- "$DIR"/.[!.]* "$DIR"/..?*

if [ -e "$1" ]; then
    du -sch "$@" 2>/dev/null | sed 's|\(\S\+\s\+\).*/|\1|'
else
    printf "${RED}No hidden files found${NC}\n"
fi