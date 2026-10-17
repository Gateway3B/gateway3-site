#!/bin/sh
# Make sure this file has LF line endings and not CRLF line endings so it can run on linux.

cd ~/Documents/gateway3-site

docker load < gateway3-site.tar

docker compose down

docker compose up