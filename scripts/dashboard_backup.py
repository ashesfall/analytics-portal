import sys
import os
import time
import subprocess

import awswrangler as wr
import boto3

access_key = os.getenv("AWS_ACCESS_KEY_ID")
secret_key = os.getenv("AWS_SECRET_ACCESS_KEY")
dashboard_bucket = os.getenv("DASHBOARD_BUCKET")

if __name__ == '__main__':
    while (True):
        time.sleep(300)

        print("Exporting dashboard data from superset...")
        subprocess.call(["superset", "export-dashboards", "-f", "/backups/dashboards.zip"])

        # print("Uploading dashboard data to S3...")
        # local_file = os.path.join("/", "dashboards.zip")
        # with open(local_file, "rb") as local_f:
        #     wr.s3.upload(local_file=local_f, path=f's3://{dashboard_bucket}/')
