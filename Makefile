VERSION = 0.2
IMAGE_NAME ?= deanillfeld/terraform-utils:$(VERSION)

PHONY: test
test:
	docker-compose -f docker-compose.test.yml up --build --quiet-pull --exit-code-from sut
	docker-compose -f docker-compose.test.yml down --rmi all

PHONY: clean
clean:
	docker-compose -f docker-compose.test.yml down --rmi all 

PHONY: tag
tag:
	git tag $(VERSION)
	git push origin $(VERSION)