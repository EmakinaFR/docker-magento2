#!/usr/bin/env sh
set -euo pipefail

if [[ $(php -r "echo (int) extension_loaded('blackfire');") -eq 1 ]]; then
    cat << CONFIG > "${PHP_INI_DIR}"/conf.d/blackfire.ini
blackfire.agent_socket=tcp://blackfire:${BLACKFIRE_PORT}
blackfire.agent_timeout=5
blackfire.log_file=/var/log/blackfire.log
blackfire.log_level=${BLACKFIRE_LOG_LEVEL}
blackfire.server_id=${BLACKFIRE_SERVER_ID}
blackfire.server_token=${BLACKFIRE_SERVER_TOKEN}
CONFIG
fi

exec "$@"
