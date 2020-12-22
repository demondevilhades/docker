
docker build -t debian-ffmpeg .

docker run --rm debian-ffmpeg ffmpeg -version
