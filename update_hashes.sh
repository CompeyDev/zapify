#!/usr/bin/bash

set -e

[[ -z "$1" ]] && echo "USAGE: $0 [directory]" && exit 1
[[ ! -d $1 ]] && echo "Directory does not exist!" && exit 1

echo -e "hash-format = \"sha256\"\n" > index.toml

for mod in $1/*.pw.toml
do
    echo "[*] Processing $(echo $mod | cut -d "/" -f2 | cut -d "." -f1)"

    #### FORMAT ####
    # [[files]]
    # file = FILE_PATH
    # hash = HASH 
    # metafile = true
    ###############
    echo -e "[[files]]\nfile = \"$mod\"\nhash = \"$(sha256sum $mod | cut -d " " -f1)\"\nmetafile = true\n" >> index.toml
done
