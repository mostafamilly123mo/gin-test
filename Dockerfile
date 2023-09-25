# Use the official Golang image to build the app
FROM golang:1.20 as builder

# Set the working directory inside the container
WORKDIR /app

# Enable Go modules
ENV GO111MODULE=on

# Copy the local package files to the container workspace
COPY . /app

# Resolve dependencies
RUN go mod tidy

# Build the Go app with verbose output
RUN go build -o main .

# Use a small image to deploy the app
FROM gcr.io/distroless/base-debian10

# Copy the binary from the `builder` image to this smaller image
COPY --from=builder /app/main /app/main

# Expose the port the app runs on
EXPOSE 9090

# Command to run the application
CMD ["/app/main"]
