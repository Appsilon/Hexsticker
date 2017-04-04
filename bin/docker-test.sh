#!/bin/bash

docker run -v `pwd`:/mnt -t $_R_PROJECT_DOCKER_IMAGE_NAME Rscript -e "setwd('/mnt/src/'); suppressMessages(devtools::load_all()); source('/mnt/linter.R'); devtools::test()"

