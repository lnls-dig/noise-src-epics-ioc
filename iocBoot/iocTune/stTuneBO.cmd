< envPaths
epicsEnvSet("TOP", "../..")
< tune.config
< tuneBO.config

####################################################

## Register all support components
dbLoadDatabase("$(TOP)/dbd/tune.dbd",0,0)
tune_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("${TOP}/db/tune.db", "P=$(P), R=$(R), SPEC_ANA=$(SPEC_ANA), AMP=$(AMP), NOISE_GEN=$(NOISE_GEN), CARRIER_GEN=$(CARRIER_GEN), TIM=$(TIM)")
dbLoadRecords("${TOP}/db/tuneBO.db", "P=$(P), R=$(R), SPEC_ANA=$(SPEC_ANA), AMP=$(AMP), NOISE_GEN=$(NOISE_GEN), CARRIER_GEN=$(CARRIER_GEN), TIM=$(TIM)")

< save_restore.cmd

iocInit

< initTuneCommands

## Start any sequence programs
# No sequencer program

# Create periodic trigger for Autosave
create_monitor_set("auto_settings_tuneBO.req", 5, "P=${P}, R=${R}")
create_triggered_set("auto_settings_tuneBO.req", "${P}${R}Save-Cmd", "P=${P}, R=${R}")
set_savefile_name("auto_settings_tuneBO.req", "auto_settings_${P}${R}.sav")
