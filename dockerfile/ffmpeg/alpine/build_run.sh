
docker build -t ffmpeg-alpine .

docker run --rm ffmpeg-alpine ffmpeg -version

docker run --rm -v ${VIDEO_PATH}:/data ffmpeg-alpine ffmpeg -i /data/${VIDEO_FILE} -codec:v libx264 -codec:a aac -hls_time 10 -hls_list_size 0 -strict -2 -f hls /data/${VIDEO_FILE_PATH}/hls.m3u8
