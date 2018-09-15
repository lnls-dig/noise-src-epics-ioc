TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = noiseSrc
# noiseSrc.dbd will be created and installed
DBD += noiseSrc.dbd

# noiseSrc.dbd will be made up from these files:
noiseSrc_DBD += base.dbd

# Include dbd files from all support applications:
#noiseSrc_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#noiseSrc_LIBS += xxx

# noiseSrc_registerRecordDeviceDriver.cpp derives from noiseSrc.dbd
noiseSrc_SRCS += noiseSrc_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
noiseSrc_SRCS_DEFAULT += noiseSrcMain.cpp
noiseSrc_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#noiseSrc_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
noiseSrc_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

noiseSrc_DBD += calcSupport.dbd
noiseSrc_DBD += asSupport.dbd

noiseSrc_LIBS += calc
noiseSrc_LIBS += autosave
