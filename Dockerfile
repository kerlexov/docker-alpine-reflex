FROM --platform=${BUILDPLATFORM:-linux/amd64} golang:1.20.3 as builder

ARG TARGETOS
ARG TARGETARCH

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go install github.com/cespare/reflex@v0.3.1

FROM --platform=${BUILDPLATFORM:-linux/amd64} alpine:3.17

COPY --from=builder /go/bin/reflex /usr/bin/reflex
RUN apk add --no-cache ca-certificates
