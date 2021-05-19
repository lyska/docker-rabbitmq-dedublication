FROM bitnami/rabbitmq:3.8.3-debian-10-r55 AS production

USER root

ADD https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.4.5/elixir-1.8.2.ez /opt/bitnami/rabbitmq/plugins/
ADD https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.4.5/rabbitmq_message_deduplication-v3.8.x_0.4.5.ez /opt/bitnami/rabbitmq/plugins/

RUN chmod 664 /opt/bitnami/rabbitmq/plugins/*.ez

USER 1001

RUN mkdir -p /opt/bitnami/rabbitmq/.rabbitmq/ \
    && mkdir -p /opt/bitnami/rabbitmq/etc/rabbitmq/

ADD ./enabled_plugins.erl /opt/bitnami/rabbitmq/etc/rabbitmq/enabled_plugins
ADD ./rabbitmq.conf /opt/bitnami/rabbitmq/etc/rabbitmq/rabbitmq.conf

RUN rabbitmq-plugins enable --offline \
    rabbitmq_management \
    rabbitmq_message_deduplication
