CI_PROJECT_NAME ?= linear
CI_COMMIT_REF_NAME ?= main
CI_COMMIT_SHA ?= main

build:
	docker build \
					-t 593357294110.dkr.ecr.eu-west-1.amazonaws.com/$(CI_PROJECT_NAME):$(CI_COMMIT_REF_NAME) \
					-t 593357294110.dkr.ecr.eu-west-1.amazonaws.com/$(CI_PROJECT_NAME):$(CI_COMMIT_SHA) \
					--network host \
					.
