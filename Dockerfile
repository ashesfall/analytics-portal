FROM apache/superset

USER root
RUN pip install "PyAthena>1.2.0"
RUN pip install awswrangler
RUN pip install geojson-to-sqlite
RUN mkdir /backups ; chmod 777 /backups

# Required for SQLite
RUN apt-get update && apt-get -y upgrade && apt-get install -y sqlite3 libsqlite3-dev
RUN apt-get install -y spatialite-bin
RUN apt-get install -y libsqlite3-mod-spatialite
RUN echo "PREVENT_UNSAFE_DB_CONNECTIONS = False" >> /app/superset/config.py

USER superset
COPY scripts/dashboard_backup.py /dashboard_backup.py
COPY scripts/dashboard_download.py /dashboard_download.py
COPY scripts/init.sh /init.sh

ENTRYPOINT /init.sh