# 1.1 Set the enviroment to crete the binary
FROM golang:alpine as builder
RUN apk add --no-cache git curl make ca-certificates gcc libtool musl-dev

# 1.2 Create the binary
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN make build

# 2.1 Set the enviroment to run the binary
FROM alpine
WORKDIR / 
COPY --from=builder /app/bin/SummingMicroservice .
COPY --from=builder /app/html/ ./html/

# 2.2 Run the binary
ENTRYPOINT ["./SummingMicroservice"]