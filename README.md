# Custom Lyska `rabbitmq`

This repository contains a custom-crafted rabbitmq, built
for lyska projects

## Installed plugins

This [`rabbitmq`](https://www.rabbitmq.com/) image also has
the [`rabbitmq_message_deduplication`](https://github.com/noxdafox/rabbitmq-message-deduplication)
plugin installed, so that we can have de-duplication queues
and/or exchanges.

## Rationale

While developing this image, we thought about putting it directly
within the [`api`](https://gitlab.com/lyska/lyska.cloud/services/lyska/api/)
project, but since it will be very stable, and move very rarely, it is
better for now to have it here, separately, and to not pollute the CI
pipeline of `api` (which is already quite complex) any further.

Should this project grow or change too often, then consider integrating
it into the `api` project directly instead.
