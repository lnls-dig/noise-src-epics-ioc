#!/bin/sh

set -e
set +u

# Parse command-line options
. ./parseCMDOpts.sh "$@"

# Use defaults if not set
if [ -z "${DEVICE_TELNET_PORT}" ]; then
   DEVICE_TELNET_PORT="20000"
fi

if [ -z "${NOISE_SRC_INSTANCE}" ]; then
   NOISE_SRC_INSTANCE="NoiseSrc1"
fi

set -u

# Run run*.sh scripts with procServ
/usr/local/bin/procServ -f -n ${NOISE_SRC_INSTANCE} -i ^C^D ${DEVICE_TELNET_PORT} ./runNoiseSrc.sh "$@"
