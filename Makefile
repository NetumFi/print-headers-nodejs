.PHONY: all
all: intro build

.PHONY: intro
intro:
	@echo "This project prints the headers of a request to std out."

.PHONY: build
build:
	docker build -t ${REGISTRY}netum/print-headers-nodejs:${VERSION} .

.PHONY: run
run:
	docker run -d --name print-headers-nodejs -p 3001:3001 ${REGISTRY}netum/print-headers-nodejs:${VERSION}

.PHONY: logs
logs:
	docker logs -f print-headers-nodejs

.PHONY: clean-run
clean-run:
	docker rm -f print-headers-nodejs

.PHONY: release
release:
	docker push ${REGISTRY}netum/print-headers-nodejs:${VERSION}