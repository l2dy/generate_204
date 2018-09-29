FROM golang:1-alpine
ADD main.go /go/src/github.com/l2dy/generate_204/
RUN go install github.com/l2dy/generate_204

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=0 /go/bin/generate_204 /go/bin/generate_204
ENTRYPOINT /go/bin/generate_204
EXPOSE 8080
