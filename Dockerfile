FROM alpine:3.1
MAINTAINER Yves Serrano <y@yas.ch>

RUN apk add --update \
        python \
        curl \
    && \
    curl -SL 'https://bootstrap.pypa.io/get-pip.py' | python2.7 && \
    apk del curl && \
    rm -rf /var/cache/apk/*
RUN pip install mkdocs==0.13.1 && \
    rm -rf /tmp/*
ADD docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["serve"]
EXPOSE 8118
