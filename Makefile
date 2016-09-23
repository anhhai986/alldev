# Makefile
#
# @since       2016-09-23
# @category    Docker
# @author      Nicola Asuni <info@tecnick.com>
# @copyright   2015-2015 Nicola Asuni - Tecnick.com LTD
# @license     http://www.gnu.org/copyleft/lesser.html GNU-LGPL v3 (see LICENSE)
# @link        https://github.com/tecnickcom/alldev
#
# This file is part of alldev project.
# ----------------------------------------------------------------------------------------------------------------------

# List special make targets that are not associated with files
.PHONY: help all build upload

# Project owner
OWNER=tecnickcom

# Project vendor
VENDOR=${OWNER}

# Project name
PROJECT=alldev

# Project version
VERSION=$(shell cat VERSION)

# Project release number (packaging build number)
RELEASE=$(shell cat RELEASE)

# Current directory
CURRENTDIR=$(shell pwd)

# --- MAKE TARGETS ---

# Display general help about this command
help:
	@echo ""
	@echo "${PROJECT} Makefile."
	@echo "The following commands are available:"
	@echo ""
	@echo "    make build       : Build the Docker image"
	@echo "    make upload      : Upload the docker image (only with the right credentials)"
	@echo ""

# Alias for help target
all: help

# Build the Docker image
build:
	docker build -t ${OWNER}/${PROJECT}:latest ./src/
	docker tag ${OWNER}/${PROJECT}:latest ${OWNER}/${PROJECT}:${VERSION}-${RELEASE}

# Upload docker image
upload:
	docker push ${OWNER}/${PROJECT}:latest
	docker push ${OWNER}/${PROJECT}:$(cat VERSION)-$(cat RELEASE)
