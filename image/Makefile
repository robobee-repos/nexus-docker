REPOSITORY := robobeerun
NAME := nexus3
VERSION ?= v3.13.0-r.1

.PHONY: build
build: _build ##@targets Builds the docker image.

.PHONY: clean
clean: _clean ##@targets Removes the local docker image.

.PHONY: deploy
deploy: _deploy ##@targets Deploys the docker image to the repository.

include ../docker-make-utils/Makefile.help
include ../docker-make-utils/Makefile.functions
include ../docker-make-utils/Makefile.image
