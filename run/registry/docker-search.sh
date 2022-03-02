#!/bin/sh
#
# Simple script that will display all docker repositorys with tags.

base_url="http://{ip}:5000/v2/"

repositorys=$(curl -s -S "${base_url}_catalog" |  sed -e 's/,/,\n/g' -e 's/\[/\[\n/g' | sed '/repositories/d' | awk -F\" '{print $2;}' | sort -fu)

for repository in ${repositorys[@]}
do
  curl  -s -S "${base_url}${repository}/tags/list" | \
    sed -e 's/"tags":/,\n/g' | \
    sed -e 's/"name":/,\n/g' | \
    grep '\[' | \
    sed -e 's/,/,\n/g' | \
    awk -F\" '{print $2;}' | \
    sort -fu | \
    sed -e "s,^,${repository}:,"
done
