FROM apache/superset

# Switching to root to install the required packages
USER root

# Install Athena suport
RUN pip install "PyAthena>1.2.0"

# Switching back to using the `superset` user
USER superset

COPY scripts/init.sh /init.sh

ENTRYPOINT /init.sh