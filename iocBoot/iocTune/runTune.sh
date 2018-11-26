#!/bin/sh

set -e
set +u

# Source environment
. ./checkEnv.sh

# Parse command-line options
. ./parseCMDOpts.sh "$@"

# Check last command return status
if [ $? -ne 0 ]; then
	echo "Could not parse command-line options" >&2
	exit 1
fi

if [ -z "$SPEC_ANA" ]; then
    echo "\$SPEC_ANA is not set, Please use -s option" >&2
    exit 2
fi

if [ -z "$AMP" ]; then
    echo "\$AMP is not set, Please use -a option" >&2
    exit 3
fi

if [ -z "$EPICS_CA_MAX_ARRAY_BYTES" ]; then
    export EPICS_CA_MAX_ARRAY_BYTES="50000000"
fi

cd "$IOC_BOOT_DIR"

P="$P" R="$R" SPEC_ANA="$SPEC_ANA" AMP="$AMP" NOISE_GEN="$NOISE_GEN" CARRIER_GEN="$CARRIER_GEN" "$IOC_BIN" stTune.cmd
