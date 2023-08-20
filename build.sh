#!/usr/bin/bash

set -e

cd versions/quilt/1.20.1
echo "####################################"
echo " Updating hashes for mod metafiles..."
echo "####################################"

source ../../../update_hashes.sh mods

declare -a deps=("packwiz" "sed")

echo ""
echo "#############################"
echo " Checking for dependencies..."
echo "#############################"

for dep in ${deps[@]}
do
    if ! which $dep 2>/dev/null; then
        echo "[!] Dependency $dep not found!"
        exit 1
    else
        echo -e "\e[1A\e[K[*] FOUND: $dep"
    fi
done

echo ""
echo "##################################"
echo " Building modpack for modrinth..."
echo "##################################"

packwiz modrinth export | sed 's/^/[packwiz]: /'

echo -e "\nBuilt modpack successfully!"
