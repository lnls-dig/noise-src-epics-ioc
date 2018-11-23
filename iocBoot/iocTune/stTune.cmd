< envPaths
epicsEnvSet("TOP", "../..")
< tune.config

####################################################

## Register all support components
dbLoadDatabase("$(TOP)/dbd/tune.dbd",0,0)
tune_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("${TOP}/db/tune.db", "P=$(P), R=$(R), NOISE_GEN=$(NOISE_GEN), CARRIER_GEN=$(CARRIER_GEN)")

< save_restore.cmd

iocInit

## Start any sequence programs
# No sequencer program

# Create periodic trigger for Autosave
create_monitor_set("auto_settings_tune.req", 5, "P=${P}, R=${R}")
set_savefile_name("auto_settings_tune.req", "auto_settings_${P}${R}.sav")
