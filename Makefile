.PHONY:

version=0.2

default: build

build:
	docker build -t yvess/mkdocs:$(version) .
