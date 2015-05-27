.PHONY:

default: build

build:
	docker build -t yvess/mkdocs .
