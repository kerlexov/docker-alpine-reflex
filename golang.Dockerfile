ARG GOLANG_IMAGE=1.20.3-alpine
FROM --platform=${BUILDPLATFORM:-linux/arm64} golang:$GOLANG_IMAGE as builder

ARG TARGETOS
ARG TARGETARCH
RUN CGO_ENABLED=0 go install github.com/cespare/reflex@v0.3.1 && \
    mv /go/bin/reflex /usr/bin/ || mv /go/bin/$(echo $TARGETOS)_$(echo $TARGETARCH)/reflex /usr/bin/

# Add ca-certificates for networking on alpine images
RUN apk add --no-cache ca-certificates || true
