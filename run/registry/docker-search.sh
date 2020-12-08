#!/bin/sh
#
# Simple script that will display docker all repositorys with tags.

base_url="http://{ip}:5000/v2/"

str=$(curl -s -S "${base_url}_catalog" |  sed -e 's/,/,\n/g' -e 's/\[/\[\n/g' | sed '/repositories/d' | awk -F\" '{print $2;}' | sort -fu)
repositorys=(${str})

#for repository in ${repositorys[@]}
#do
##  echo "${repository}"
#  curl -s -S "${base_url}${repository}/tags/list" | \
#    sed -e 's/,/,\n/g' -e 's/\[/\[\n/g' | \
#    grep '"tags"' | \
#    awk -F\" '{print $4;}' | \
#    sort -fu | \
#    sed -e "s/^/${repository}:/"
#done

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
