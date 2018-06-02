FROM golang:1.10-alpine as go
WORKDIR /go/src/github.com/bign8/goto/
ADD /*.go ./
RUN go build -ldflags="-s -w" -v

# TODO: use upx to compress output binary

FROM alpine
EXPOSE 8080
COPY --from=go /go/src/github.com/bign8/goto/goto /
ENTRYPOINT ["/goto"]
