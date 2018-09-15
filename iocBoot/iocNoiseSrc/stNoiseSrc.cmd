< envPaths
epicsEnvSet("TOP", "../..")
< noiseSrc.config

####################################################

## Register all support components
dbLoadDatabase("$(TOP)/dbd/noiseSrc.dbd",0,0)
noiseSrc_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("${TOP}/db/noiseSrc.db", "P=$(P), R=$(R), NOISE_GEN=$(NOISE_GEN), CARRIER_GEN=$(CARRIER_GEN)")

< save_restore.cmd

iocInit

## Start any sequence programs
# No sequencer program

# Create periodic trigger for Autosave
create_monitor_set("auto_settings_noiseSrc.req", 5, "P=${P}, R=${R}")
set_savefile_name("auto_settings_noiseSrc.req", "auto_settings_${P}${R}.sav")
