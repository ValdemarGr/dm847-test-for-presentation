FROM golang AS builder
COPY . /
WORKDIR /
RUN go get && CGO_ENABLED=0 GOOS=linux go build -o server .

FROM scratch
LABEL maintainer="Valdemar Grange <randovmald0069@gmail.com>"
COPY --from=builder /server /server
EXPOSE 8080
WORKDIR /
ENTRYPOINT [ "./server" ]
