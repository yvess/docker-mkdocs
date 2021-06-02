.PHONY:

version=0.6

default: build

build:
	docker buildx build --platform linux/arm64,linux/amd64 -t yvess/mkdocs:$(version) .

push:
	# docker buildx build --push --platform linux/arm64,linux/amd64 -t yvess/mkdocs:$(version) .
	docker buildx build --push --platform linux/arm64,linux/amd64 -t yvess/mkdocs:latest .
