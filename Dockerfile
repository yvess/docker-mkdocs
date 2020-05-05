FROM alpine:3.11
MAINTAINER Yves Serrano <y@yas.ch>

RUN apk add --no-cache python3
RUN apk add --no-cache build-base python3-dev git && \
    pip3 install \
        mkdocs==1.1 Pygments==2.6.1 mkdocs-material==4.6.3 \
        beautifulsoup4==4.8.2 fontawesome-markdown==0.2.6 markdown-vidify==0.1.1 && \
    pip3 install git+https://github.com/pugong/mkdocs-mermaid-plugin && \
    apk del build-base python3-dev && \
    rm -rf /tmp/*
ADD docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["serve"]
EXPOSE 80
