#create multi stage Docker
#build stage
FROM golang:1.21.1-alpine as builder

#Set the working directory 
WORKDIR /app

COPY . .

#Build the app
RUN go build -o myapp

#use a smaller image to reduce the size of the final container
FROM alpine:latest
#Set working Directory 
WORKDIR /root/ 

#copy the binary from the builder
COPY --from=builder /app/myapp .

#Execute the app
CMD ["./myapp"]