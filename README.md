# Custom Lyska `rabbitmq`

This repository contains a custom-crafted rabbitmq, built
for lyska projects, and compatible with the semantics of
[`bitnami/rabbitmq:3.8.*`](https://github.com/bitnami/bitnami-docker-rabbitmq).

## Configuration

This project has the defaults of `bitnami/rabbitmq`, which
prevent usage of `amqp://guest:guest@rabbitmq-host:5672` nor
`http://guest:guest@rabbitmq-host:15672` by default.

If you need to enable `guest:guest` access for AMQP and
management UI, mount following config under 
`/opt/bitnami/rabbitmq/etc/rabbitmq/rabbitmq.conf`:

```ini
#rabbitmq.conf
default_user=guest
default_pass=guest
loopback_users=none
```

You will also need to use a custom `command: rabbitmq-server` in your
k8s container manifest or docker-compose manifest.

This is what the default chart for
[`rabbitmq-6.25.5` also does](https://github.com/bitnami/charts/blob/79eb3b5e84204f9ac557db53c3c987acdb686655/bitnami/rabbitmq/templates/statefulset.yaml#L81-L105).

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
