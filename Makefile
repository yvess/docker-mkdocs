.PHONY:

version=0.5

default: build

build:
	docker build -t yvess/mkdocs:$(version) .

push:
	docker push yvess/mkdocs:$(version)
