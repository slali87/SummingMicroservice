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