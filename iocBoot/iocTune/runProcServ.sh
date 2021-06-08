#!/bin/sh

set -e
set +u

# Parse command-line options
. ./parseCMDOpts.sh "$@"

# Use defaults if not set
UNIX_SOCKET=""
if [ -z "${DEVICE_TELNET_PORT}" ]; then
    UNIX_SOCKET="true"
fi

if [ -z "${TUNE_INSTANCE}" ]; then
   TUNE_INSTANCE="Tune1"
fi

set -u

# Run run*.sh scripts with procServ
if [ "${UNIX_SOCKET}" ]; then
    /usr/local/bin/procServ -f -n ${TUNE_INSTANCE} -i ^C^D unix:./procserv.sock ./runTune.sh "$@"
else
    /usr/local/bin/procServ -f -n ${TUNE_INSTANCE} -i ^C^D ${DEVICE_TELNET_PORT} ./runTune.sh "$@"
fi
