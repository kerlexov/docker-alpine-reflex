FROM golang:1.12-alpine3.9 as builder

ENV GOOS=linux
ENV GOARCH=amd64
RUN apk add --no-cache git && \
    go get -v github.com/cespare/reflex && \
    go install github.com/cespare/reflex

FROM amd64/alpine:3.9

COPY --from=builder /go/bin/reflex /usr/bin/reflex
RUN apk add --no-cache ca-certificates
