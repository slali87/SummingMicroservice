# Local targets
APP = SummingMicroservice
BIN_LINUX = ./bin/$(APP)
CMD_SRC = ./cmd/$(APP)/main.go

build:
	go build -o $(BIN_LINUX) $(CMD_SRC)

run: build
	$(BIN_LINUX) --addr 127.0.0.1 --port 8081

clean:
	go mod tidy
	rm -rf ./bin/

# Docker-specific targets
APP_LOWER_CASE = $(shell echo $(APP) | tr A-Z a-z)
TAG = localhost/$(APP_LOWER_CASE):dev

local-docker-build:
	docker build -t $(TAG) .

local-docker-run:
	docker run --rm -p 8081:80 $(TAG)

# GCloud-specific targets
TAG_GCLOUD = gcr.io/$(GCP_PROJECT_ID)/$(APP_LOWER_CASE):$(ENVIRONMENT)

gcloud-docker-init:
	gcloud auth configure-docker

gcloud-docker-build:
	docker build -t $(TAG_GCLOUD) .

gcloud-docker-push:
	docker push $(TAG_GCLOUD)

gcloud-run-deploy:
	gcloud run deploy $(APP_LOWER_CASE)-$(ENVIRONMENT) \
	--region europe-west1 \
	--image $(TAG_GCLOUD) \
	--port 80 \
	--project $(GCP_PROJECT_ID) \
	--max-instances 1 \
	--platform managed \
	--labels environment=$(ENVIRONMENT) \
	--allow-unauthenticated