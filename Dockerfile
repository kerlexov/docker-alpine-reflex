FROM golang:1.11-alpine3.8 as builder

RUN apk add --no-cache git && \
    go get -v github.com/cespare/reflex && \
    go install github.com/cespare/reflex

FROM alpine:3.8

COPY --from=builder /go/bin/reflex /usr/bin/reflex
RUN apk add --no-cache ca-certificates
