import os
import awswrangler as wr

dashboard_bucket = os.getenv("DASHBOARDS_BUCKET")
geojson_file = os.getenv("GEOJSON_FILE")

if __name__ == '__main__':
    print("Downloading geojson from S3...")
    wr.s3.download(path=f's3://{dashboard_bucket}/{geojson_file}', local_file='/backups/data.geojson')

    print("Downloading dashboards from S3...")
    wr.s3.download(path=f's3://{dashboard_bucket}/dashboards.zip', local_file='/backups/dashboards.zip')
