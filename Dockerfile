# Base this docker container off the official golang docker image.
# Docker containers inherit everything from their base.
FROM golang:1.11.2
# Create a directory inside the container to store all our application and then make it the working directory.
RUN mkdir -p /go/src/example-app
WORKDIR /go/src/example-app
# Copy the example-app directory (where the Dockerfile lives) into the container.
COPY example-app /go/src/example-app
# Download and install any required third party dependencies into the container.
RUN go-wrapper download
RUN go-wrapper install
# Set the PORT environment variable inside the container
ENV PORT 8081
# Expose port 8080 to the host so we can access our application
EXPOSE 8081
# Now tell Docker what command to run when the container starts
CMD ["go-wrapper", "run"]