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
$ ./runTune.sh -n "NOISE_GEN" -c "CARRIER_GEN"
```

where `NOISE_GEN` and `CARRIEN_GEN` are the PV prefixes used for
the Noise Generator and Carrier Frequency Generator IOCs, respectively.
The options that you can specify (after `./runTune.sh`) are:

- `-n NOISE_GEN`: PV prefix of the Noise Generator IOC (required)
- `-c CARRIER_GEN`: PV prefix of the Carrier Frequency Generator IOC (required)
- `-P PREFIX1`: the value of the EPICS `$(P)` macro used to prefix the PV names
- `-R PREFIX2`: the value of the EPICS `$(R)` macro used to prefix the PV names

In some situations it is desired to run the process using procServ,
which enables the IOC to be controlled by the system. In order to
run the IOC with procServ, instead of the previous command, run:

```sh
$ ./runProcServ.sh -t "TELNET_PORT" -n "NOISE_GEN" -c "CARRIER_GEN" -P "PREFIX1" -R "PREFIX2"
```

where `TELNET_PORT` is the telnet port through which the IOC shell
will be accessible. The other options are as previously described.
