#!/bin/sh

set -e

echo $(pwd)
echo $(printenv)
echo $(ls -lrt /s3fs-fuse)

echo "$AWS_KEY:$AWS_SECRET_KEY" > passwd && chmod 600 passwd
s3fs "$S3_BUCKET" "$MNT_POINT" -o passwd_file=passwd  && tail -f /dev/null
