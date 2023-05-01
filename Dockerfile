FROM golang:alpine3.17 as builder 
WORKDIR /go/src/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -a -installsuffix cgo -o hello .

FROM scratch
COPY --from=builder /go/src/ / 
ENTRYPOINT [ "/hello" ]