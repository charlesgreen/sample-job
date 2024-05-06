FROM golang:latest AS base
WORKDIR /app
ENV GO111MODULE=on
ENV	CGO_ENABLED=0
ENV	GOOS=linux
ENV	GOARCH=amd64
COPY . .
RUN  go build -v -o app

FROM scratch as app
COPY --from=base app /
ADD passwd.minimal /etc/passwd
USER nonroot

CMD ["/app"]
