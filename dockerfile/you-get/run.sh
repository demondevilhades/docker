
# show info
docker run --rm you-get:3-alpine -i "<url>"

# download
docker run --rm -v ~/Downloads:/data/download you-get:3-alpine <download-with> "<url>"

