FROM apache/superset

USER root
RUN pip install "PyAthena>1.2.0"
RUN pip install awswrangler
RUN mkdir /backups ; chmod 777 /backups

USER superset
COPY scripts/dashboard_backup.py /dashboard_backup.py
COPY scripts/dashboard_download.py /dashboard_download.py
COPY scripts/init.sh /init.sh

ENTRYPOINT /init.sh