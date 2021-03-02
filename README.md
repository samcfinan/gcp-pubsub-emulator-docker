# PubSub Emulator

A Dockerized version of the official GCP Pub/Sub Emulator provided in the `gcloud` SDK. The image is meant to be used for creating an standalone emulator for testing.

## Docker

Run via Docker

```
docker run samcfinan/gcp-pubsub-emulator -e PUBSUB_LISTEN_ADDRESS=<address> -e PUBSUB_PROJECT_ID=<projectID>
```

## Environment

The following environment variables must be set:

- `PUBSUB_LISTEN_ADDRESS`: The address should refer to a listen address, meaning that 0.0.0.0 can be used. The address must use the syntax `HOST:PORT`, for example `0.0.0.0:8085`. The container must expose the port used by the Pub/Sub emulator.
- `PUBSUB_PROJECT_ID`: The ID of the Google Cloud project for the emulator.

### Custom Commands

This image contains a script named `pubsub-config` (included in the PATH). This script is used to initialize the Pub/Sub emulator.

### Persistence

The image has a volume mounted at `/opt/data`. To maintain states between restarts, mount a volume at this location.
