# Use google cloud sdk
FROM google/cloud-sdk:alpine

# Install Java 8 for Pub/Sub emulator
RUN apk --update add openjdk8-jre
RUN gcloud components install pubsub-emulator beta --quiet

# Volume to persist Pub/Sub data
VOLUME /opt/data

COPY pubsub-config .
RUN chmod +x pubsub-config

EXPOSE 8432

ENTRYPOINT ["./pubsub-config"]