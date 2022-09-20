FROM golang:1.19.0-alpine as build-env
WORKDIR /go/src/app
COPY . /go/src/app
RUN go build -o ./kube-job-notifier *.go

FROM alpine:3.16
LABEL maintainer="yevhen <yevhen.zavhorodnii@gmail.com>"

COPY --from=build-env /go/src/app/kube-job-notifier .

ENTRYPOINT ["./kube-job-notifier"]
