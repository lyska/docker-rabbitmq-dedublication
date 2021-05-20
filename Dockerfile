FROM rabbitmq:3.8.3

ADD https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.5.0/elixir-1.10.4.ez /plugins
ADD https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.5.0/rabbitmq_message_deduplication-0.5.0.ez /plugins

RUN chmod 664 /plugins/*.ez

RUN rabbitmq-plugins enable --offline rabbitmq_management rabbitmq_message_deduplication