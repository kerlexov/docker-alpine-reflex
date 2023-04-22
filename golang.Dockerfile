FROM --platform=${BUILDPLATFORM:-linux/amd64} golang:1.20.3-alpine as builder

ARG TARGETOS
ARG TARGETARCH
RUN CGO_ENABLED=0 go install github.com/cespare/reflex@v0.3.1 && \
    mv /go/bin/reflex /go/bin || mv /go/bin/$(echo $TARGETOS)_$(echo $TARGETARCH)/reflex /go/bin

RUN apk add --no-cache ca-certificates
