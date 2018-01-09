FROM debian:stable-slim

RUN apt-get update && apt-get install -y curl
# Stage default configuration, metrics spec and example setup
ADD ./pipeline-data /data
ADD pipeline /pipeline
ADD startup.sh /startup.sh

VOLUME ["/data"]
WORKDIR /

EXPOSE 5432
CMD ./startup.sh
