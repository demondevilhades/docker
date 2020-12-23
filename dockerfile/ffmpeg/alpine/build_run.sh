
docker build -t ffmpeg-alpine .

docker run --rm ffmpeg-alpine ffmpeg -version

docker run --rm \
-v ${INPUT_PATH}:/data_input:ro \
-v ${OUTPUT_PATH}:/data_output:rw \
ffmpeg-alpine ffmpeg -i /data_input/${VIDEO_FILE} -codec:v libx264 -codec:a aac -hls_time 10 -hls_list_size 0 -strict -2 -f hls /data_output/${VIDEO_FILE_PATH}/hls.m3u8
