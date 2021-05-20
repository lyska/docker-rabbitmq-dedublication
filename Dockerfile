FROM rabbitmq:3.8.3

ADD https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.4.5/elixir-1.8.2.ez /plugins
ADD https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.4.5/rabbitmq_message_deduplication-v3.8.x_0.4.5.ez /plugins

RUN rabbitmq-plugins enable --offline rabbitmq_message_deduplication