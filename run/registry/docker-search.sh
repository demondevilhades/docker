#!/bin/sh
#
# Simple script that will display all docker repositorys with tags.

base_url="http://{ip}:5000/v2/"

repositorys=$(curl -s -S "${base_url}_catalog" |  sed -e 's/,/,\n/g' -e 's/\[/\[\n/g' | sed '/repositories/d' | awk -F\" '{print $2;}' | sort -fu)

for repository in ${repositorys[@]}
do
  curl  -s -S "${base_url}${repository}/tags/list" | \
    sed -e 's/,/,\n/g' | \
    grep '"tags"' | \
    sed -e 's/\[/\[\n/g' | \
    sed '/tags/d' | \
    awk -F\" '{print $2;}' | \
    sort -fu | \
    sed -e "s,^,${repository}:,"
done
