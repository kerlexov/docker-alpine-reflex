FROM golang:1.17.0-alpine3.14 as builder

ENV GOOS=linux
ENV GOARCH=amd64
RUN apk add --no-cache git && \
    go install github.com/cespare/reflex@v0.3.1

FROM alpine:3.14

COPY --from=builder /go/bin/reflex /usr/bin/reflex
RUN apk add --no-cache ca-certificates
