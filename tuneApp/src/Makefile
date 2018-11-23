TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = tune
# tune.dbd will be created and installed
DBD += tune.dbd

# tune.dbd will be made up from these files:
tune_DBD += base.dbd

# Include dbd files from all support applications:
#tune_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#tune_LIBS += xxx

# tune_registerRecordDeviceDriver.cpp derives from tune.dbd
tune_SRCS += tune_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
tune_SRCS_DEFAULT += tuneMain.cpp
tune_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#tune_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
tune_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

tune_DBD += calcSupport.dbd
tune_DBD += asSupport.dbd

tune_LIBS += calc
tune_LIBS += autosave
