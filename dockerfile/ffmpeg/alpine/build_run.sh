
docker build -t ffmpeg-alpine .

docker run --rm ffmpeg-alpine ffmpeg -version
