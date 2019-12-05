#!/usr/bin/env bash

set -e

apt-get update
apt-get install -y --no-install-recommends curl zip unzip pkg-config

file_name=$MOODLE_MLBACKEND_PYTHON_VERSION'.zip'
url="https://github.com/moodlehq/moodle-mlbackend-python/archive/$file_name"
echo $url
zip_dir="/tmp/moodle-mlbackend-python.zip"
curl -L "$url"  -o "$zip_dir"

echo $zip_dir
ls -l "/tmp"
unzip "$zip_dir" -d /tmp

mv "/tmp/moodle-mlbackend-python-$MOODLE_MLBACKEND_PYTHON_VERSION" /app

apt-get remove --purge -y
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/*
