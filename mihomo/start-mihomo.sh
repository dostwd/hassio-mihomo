#!/usr/bin/env bash
set -e

# Пробуем оба варианта пути на случай специфики монтирования
if [ -f "/config/mihomo.yaml" ]; then
    CONFIG_FILE="/config/mihomo_proxy/mihomo.yaml"
elif [ -f "/homeassistant/mihomo.yaml" ]; then
    CONFIG_FILE="/homeassistant/mihomo.yaml"
else
    echo "Custom config NOT FOUND. Using default."
    CONFIG_FILE="/app/mihomo-default.yaml"
fi

echo "Starting Mihomo with config: $CONFIG_FILE"

# Запускаем БЕЗ лишних флагов, которые вызывают ошибку
exec /app/mihomo -d /config/mihomo_proxy -f "$CONFIG_FILE"
