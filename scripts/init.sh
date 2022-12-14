#!/bin/sh
export SUP_WEBSERVER_WORKERS=5
export SUP_WEBSERVER_PORT=8088
export SUP_WEBSERVER_TIMEOUT=300
export SUP_WEBSERVER_LOG_LEVEL=info

superset fab create-admin \
                  --username admin \
                  --firstname Superset \
                  --lastname Admin \
                  --email "$ADMIN_EMAIL" \
                  --password "$ADMIN_PASSWORD"
superset db upgrade
superset init

python /dashboard_download.py
superset import-dashboards --path /backups/dashboards.zip

gunicorn \
      -w ${SUP_WEBSERVER_WORKERS} \
      --timeout ${SUP_WEBSERVER_TIMEOUT} \
      -b  0.0.0.0:${SUP_WEBSERVER_PORT} \
      --log-level ${SUP_WEBSERVER_LOG_LEVEL} \
      "superset.app:create_app()"