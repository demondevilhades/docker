
# show info
docker run --rm you-get:3-alpine -i "<url>"

# download
docker run --rm -u 1000:1000 -v ~/Downloads:/data/download you-get:3-alpine <download-with> "<url>"

### youku
docker run --rm -u 1000:1000 -v ~/Downloads:/data/download you-get:3-alpine --format=mp4hd2v2 "<url.lang>"

### qq
docker run --rm -u 1000:1000 -v ~/Downloads:/data/download you-get:3-alpine "<url>"

### iqiyi
docker run --rm -u 1000:1000 -v ~/Downloads:/data/download you-get:3-alpine --format=TD_H265 "<url>"

### mgtv
docker run --rm -u 1000:1000 -v ~/Downloads:/data/download you-get:3-alpine --format=hd "<url>"

