# tune-epics-ioc

### Overall

Repository containing the EPICS Soft IOC for controlling the main
parameters of a noise source.

The noise source is composed of two devices, a
[noise generator](https://github.com/lnls-dig/agilent33521a-epics-ioc)
and a [carrier frequency generator](https://github.com/lnls-dig/valon5009-epics-ioc).
Most of the configuration of the devices should be performed
using the corresponding IOC, since only a few parameters are
available to the high-level Soft IOC.

### Building

In order to build the IOC, from the top level directory, run:

```sh
$ make clean uninstall install
```
### Running

In order to run the IOC, from the top level directory, run:

```sh
$ cd iocBoot/iocTune &&
$ ./runTune.sh -d "DEVICE_TYPE" -n "NOISE_GEN" -c "CARRIER_GEN" -s "TUNE_PROC" -a "AMPLIFIER" -i "TIMING" -P "PREFIX_AREA" -R "PREFIX_DEV"
```

where `NOISE_GEN`, `CARRIEN_GEN`, `TUNE_PROC` and `AMPLIFIER`
are the PV prefixes used for the Noise Generator, Carrier
Frequency Generator, Tune Processor and Amplifier IOCs, respectively.
The options that you can specify (after `./runTune.sh`) are:

- `-n NOISE_GEN`: PV prefix of the Noise Generator IOC (required)
- `-c CARRIER_GEN`: PV prefix of the Carrier Frequency Generator IOC (required)
- `-s TUNE_PROC`: PV prefix of the Tune Processor IOC (required)
- `-a AMPLIFIER`: PV prefix of the Amplifier IOC (required)
- `-i TIMING`: PV prefix of the Timing IOC (required)
- `-d DEVICE_TYPE`: device type, Storage Ring (SI) or Booster (BO) (required)
- `-P PREFIX1`: the value of the EPICS `$(P)` macro used to prefix the PV names
- `-R PREFIX2`: the value of the EPICS `$(R)` macro used to prefix the PV names

In some situations it is desired to run the process using procServ,
which enables the IOC to be controlled by the system. In order to
run the IOC with procServ, instead of the previous command, run:

```sh
$ ./runProcServ.sh -t "TELNET_PORT" -d "MACHINE_TYPE" -n "NOISE_GEN" -c "CARRIER_GEN" -s "TUNE_PROC" -a "AMPLIFIER" -i "TIMING" -P "PREFIX1" -R "PREFIX2"
```

where `TELNET_PORT` is the telnet port through which the IOC shell
will be accessible. The other options are as previously described.
