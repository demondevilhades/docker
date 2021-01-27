FROM python:3-alpine

MAINTAINER awesome

RUN apk --no-cache add ffmpeg \
 && pip3 install --no-cache-dir you-get

VOLUME /data/download

WORKDIR /data/download

ENTRYPOINT [ "you-get" ]
CMD [ "--help" ]

