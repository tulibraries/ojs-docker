#!/usr/bin/env bash

# set -euo pipefail
# set -o errexit
# set -o errtrace
# IFS=$'\n\t'


# s3fs config
#export S3_ACL=${S3_ACL:-private}

# test $MOUNT_POINT
# rm -rf ${MOUNT_POINT}
# mkdir -p ${MOUNT_POINT}
# 
# export AWSACCESSKEYID=${AWSACCESSKEYID:-$AWS_ACCESS_KEY_ID}
# export AWSSECRETACCESSKEY=${AWSSECRETACCESSKEY:-$AWS_SECRET_ACCESS_KEY}
# /usr/bin/s3fs ${S3_BUCKET} ${MOUNT_POINT} -o nosuid,nonempty,nodev,allow_other,default_acl=${S3_ACL},retries=5


# Loads OJS default enviroment variables
source /etc/ojs.config.env

# Creates OJS configuration file
config-creator > ${APP_DIR}/config.inc.php

exec "$@"


