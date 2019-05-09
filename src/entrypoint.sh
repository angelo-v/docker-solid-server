#!/bin/sh

set -e

./checks.sh

./create-temporary-cert.sh ${TEMPORARY_CERT_NAME}

solid "$@"
