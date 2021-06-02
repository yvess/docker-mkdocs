.PHONY:

version=0.6

default: build

build:
	docker build -t yvess/mkdocs:$(version) .

push:
	docker push yvess/mkdocs:$(version)
