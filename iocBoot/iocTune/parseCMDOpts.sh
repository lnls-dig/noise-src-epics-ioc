#!/bin/sh

set -e

usage () {
    echo "Usage:" >&2
    echo "  $1 -t PROCSERV_TELNET_PORT [-P P_VAL] [-R R_VAL] -n NOISE_GEN -c CARRIER_GEN " >&2
    echo >&2
    echo " Options:" >&2
    echo "  -t                  Configure procServ telnet port" >&2
    echo "  -P                  Configure value of \$(P) macro" >&2
    echo "  -R                  Configure value of \$(R) macro" >&2
    echo "  -n                  Configure corresponding noise generator PV prefix" >&2
    echo "  -c                  Configure corresponding carrier freq generator PV prefix" >&2
    echo "  -s                  Configure corresponding spectrum analyzer PV prefix" >&2
    echo "  -a                  Configure corresponding amplifier PV prefix" >&2
}

while getopts ":t:P:R:n:c:s:a:" opt; do
  case $opt in
    t) DEVICE_TELNET_PORT="$OPTARG" ;;
    P) P="$OPTARG" ;;
    R) R="$OPTARG" ;;
    n) NOISE_GEN="$OPTARG" ;;
    c) CARRIER_GEN="$OPTARG" ;;
    s) SPEC_ANA="$OPTARG" ;;
    a) AMP="$OPTARG" ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage $0
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      usage $0
      exit 1
      ;;
  esac
done

# if getopts did not process all input
if [ "$OPTIND" -le "$#" ]; then
    echo "Invalid argument at index '$OPTIND' does not have a corresponding option." >&2
    usage $0
    exit 1
fi
