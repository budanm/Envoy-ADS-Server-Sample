FROM golang:1.13-alpine3.10 as builder

WORKDIR /app

#bring the go project dependencies
RUN apk add --update --no-cache ca-certificates git

# Copy the local package files to the container's workspace.
COPY go.mod go.sum ./
RUN go mod download

COPY . ./cmd/main/control-plane/
RUN ls /app
# RUN go build -o main .
#build the go project
WORKDIR /app/cmd/main/control-plane
RUN CGO_ENABLED=0 GOOS=linux go build -o main -ldflags "-s" -a -installsuffix cgo .


#main image
# FROM scratch
FROM alpine:3.10.2

WORKDIR /app

# Copy the output from builder image to main image
COPY --from=builder /app/cmd/main/control-plane/main ./
# Copy ca certs
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

EXPOSE 18000
EXPOSE 18080

# Run the sync agent executable by default when the container starts.
ENTRYPOINT ["./main"]