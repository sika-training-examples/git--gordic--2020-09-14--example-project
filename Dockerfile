FROM golang:1.14 as build
WORKDIR /build
COPY main.go .
ENV CGO_ENABLED=0
RUN go build -o hello -a -ldflags \
  '-extldflags "-static"' .

FROM scratch
COPY --from=build /build/hello .
CMD ["/hello"]
