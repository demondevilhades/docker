
docker build -t ffmpeg-debian .

docker run --rm ffmpeg-debian ffmpeg -version
