% This is part of the secrets mounted in the k8s environment (as files) to configure rabbitmq.
% This file only exists as a "placeholder" with some standard defaults: production will likely
% override it.
[rabbitmq_management,
    rabbitmq_message_deduplication,
    rabbitmq_auth_backend_ldap].
