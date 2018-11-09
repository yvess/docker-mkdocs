FROM alpine:3.8
MAINTAINER Yves Serrano <y@yas.ch>

RUN apk add python3
RUN pip3 install --upgrade pip && \
    pip3 install mkdocs==1.0.4 Pygments==2.2.0 && \
    rm -rf /tmp/*
ADD docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["serve"]
EXPOSE 80
