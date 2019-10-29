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

if [ "$DEVICE_TYPE" = "BO" ] && [ -z "$NOISE_GEN" ]; then
    echo "\$NOISE_GEN is not set and device type is BO, Please use -n option" >&2
    exit 4
fi

if [ "$DEVICE_TYPE" = "BO" ] && [ -z "$CARRIER_GEN" ]; then
    echo "\$CARRIER_GEN is not set and device type is BO, Please use -c option" >&2
    exit 5
fi

if [ "$DEVICE_TYPE" = "BO" ] && [ -z "$TIM" ]; then
    echo "\$TIM is not set and device type is BO, Please use -i option" >&2
    exit 6
fi

if [ -z "$EPICS_CA_MAX_ARRAY_BYTES" ]; then
    export EPICS_CA_MAX_ARRAY_BYTES="50000000"
fi

cd "$IOC_BOOT_DIR"

ST_CMD_FILE=
# Select the appropriate ST_CMD file and
# Generate .proto from .proto.in depending on $DEVICE_TYPE
case ${DEVICE_TYPE} in
    SI)
        ST_CMD_FILE=stTuneSI.cmd
        ;;

    BO)
        ST_CMD_FILE=stTuneBO.cmd
        ;;
    *)
        echo "Invalid Device type: "${DEVICE_TYPE} >&2
        exit 1
        ;;
esac

echo "Using st.cmd file: "${ST_CMD_FILE}

P="$P" R="$R" SPEC_ANA="$SPEC_ANA" AMP="$AMP" NOISE_GEN="$NOISE_GEN" CARRIER_GEN="$CARRIER_GEN" TIM="$TIM" "$IOC_BIN" ${ST_CMD_FILE}
