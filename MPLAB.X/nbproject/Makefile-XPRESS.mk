#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-XPRESS.mk)" "nbproject/Makefile-local-XPRESS.mk"
include nbproject/Makefile-local-XPRESS.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=XPRESS
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=system_config/XPRESS/system.c main.c usb_descriptors.c app_device_msd.c files.c direct.c lvp.c app_device_cdc.c ../bsp/xpress/buttons.c ../bsp/xpress/leds.c ../bsp/xpress/uart.c ../framework/usb/src/usb_device.c ../framework/usb/src/usb_device_msd.c ../framework/usb/src/usb_device_cdc.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/system_config/XPRESS/system.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/usb_descriptors.p1 ${OBJECTDIR}/app_device_msd.p1 ${OBJECTDIR}/files.p1 ${OBJECTDIR}/direct.p1 ${OBJECTDIR}/lvp.p1 ${OBJECTDIR}/app_device_cdc.p1 ${OBJECTDIR}/_ext/1371762614/buttons.p1 ${OBJECTDIR}/_ext/1371762614/leds.p1 ${OBJECTDIR}/_ext/1371762614/uart.p1 ${OBJECTDIR}/_ext/2142726457/usb_device.p1 ${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1 ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/system_config/XPRESS/system.p1.d ${OBJECTDIR}/main.p1.d ${OBJECTDIR}/usb_descriptors.p1.d ${OBJECTDIR}/app_device_msd.p1.d ${OBJECTDIR}/files.p1.d ${OBJECTDIR}/direct.p1.d ${OBJECTDIR}/lvp.p1.d ${OBJECTDIR}/app_device_cdc.p1.d ${OBJECTDIR}/_ext/1371762614/buttons.p1.d ${OBJECTDIR}/_ext/1371762614/leds.p1.d ${OBJECTDIR}/_ext/1371762614/uart.p1.d ${OBJECTDIR}/_ext/2142726457/usb_device.p1.d ${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1.d ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/system_config/XPRESS/system.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/usb_descriptors.p1 ${OBJECTDIR}/app_device_msd.p1 ${OBJECTDIR}/files.p1 ${OBJECTDIR}/direct.p1 ${OBJECTDIR}/lvp.p1 ${OBJECTDIR}/app_device_cdc.p1 ${OBJECTDIR}/_ext/1371762614/buttons.p1 ${OBJECTDIR}/_ext/1371762614/leds.p1 ${OBJECTDIR}/_ext/1371762614/uart.p1 ${OBJECTDIR}/_ext/2142726457/usb_device.p1 ${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1 ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1

# Source Files
SOURCEFILES=system_config/XPRESS/system.c main.c usb_descriptors.c app_device_msd.c files.c direct.c lvp.c app_device_cdc.c ../bsp/xpress/buttons.c ../bsp/xpress/leds.c ../bsp/xpress/uart.c ../framework/usb/src/usb_device.c ../framework/usb/src/usb_device_msd.c ../framework/usb/src/usb_device_cdc.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-XPRESS.mk ${DISTDIR}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F25K50
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/system_config/XPRESS/system.p1: system_config/XPRESS/system.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/system_config/XPRESS" 
	@${RM} ${OBJECTDIR}/system_config/XPRESS/system.p1.d 
	@${RM} ${OBJECTDIR}/system_config/XPRESS/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/system_config/XPRESS/system.p1 system_config/XPRESS/system.c 
	@-${MV} ${OBJECTDIR}/system_config/XPRESS/system.d ${OBJECTDIR}/system_config/XPRESS/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/system_config/XPRESS/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/main.p1 main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/usb_descriptors.p1: usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/usb_descriptors.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/usb_descriptors.p1 usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/usb_descriptors.d ${OBJECTDIR}/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/app_device_msd.p1: app_device_msd.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/app_device_msd.p1.d 
	@${RM} ${OBJECTDIR}/app_device_msd.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/app_device_msd.p1 app_device_msd.c 
	@-${MV} ${OBJECTDIR}/app_device_msd.d ${OBJECTDIR}/app_device_msd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/app_device_msd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/files.p1: files.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/files.p1.d 
	@${RM} ${OBJECTDIR}/files.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/files.p1 files.c 
	@-${MV} ${OBJECTDIR}/files.d ${OBJECTDIR}/files.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/files.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/direct.p1: direct.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/direct.p1.d 
	@${RM} ${OBJECTDIR}/direct.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/direct.p1 direct.c 
	@-${MV} ${OBJECTDIR}/direct.d ${OBJECTDIR}/direct.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/direct.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/lvp.p1: lvp.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/lvp.p1.d 
	@${RM} ${OBJECTDIR}/lvp.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/lvp.p1 lvp.c 
	@-${MV} ${OBJECTDIR}/lvp.d ${OBJECTDIR}/lvp.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/lvp.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/app_device_cdc.p1: app_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/app_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/app_device_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/app_device_cdc.p1 app_device_cdc.c 
	@-${MV} ${OBJECTDIR}/app_device_cdc.d ${OBJECTDIR}/app_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/app_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1371762614/buttons.p1: ../bsp/xpress/buttons.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1371762614" 
	@${RM} ${OBJECTDIR}/_ext/1371762614/buttons.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1371762614/buttons.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1371762614/buttons.p1 ../bsp/xpress/buttons.c 
	@-${MV} ${OBJECTDIR}/_ext/1371762614/buttons.d ${OBJECTDIR}/_ext/1371762614/buttons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1371762614/buttons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1371762614/leds.p1: ../bsp/xpress/leds.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1371762614" 
	@${RM} ${OBJECTDIR}/_ext/1371762614/leds.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1371762614/leds.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1371762614/leds.p1 ../bsp/xpress/leds.c 
	@-${MV} ${OBJECTDIR}/_ext/1371762614/leds.d ${OBJECTDIR}/_ext/1371762614/leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1371762614/leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1371762614/uart.p1: ../bsp/xpress/uart.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1371762614" 
	@${RM} ${OBJECTDIR}/_ext/1371762614/uart.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1371762614/uart.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1371762614/uart.p1 ../bsp/xpress/uart.c 
	@-${MV} ${OBJECTDIR}/_ext/1371762614/uart.d ${OBJECTDIR}/_ext/1371762614/uart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1371762614/uart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2142726457/usb_device.p1: ../framework/usb/src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2142726457" 
	@${RM} ${OBJECTDIR}/_ext/2142726457/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2142726457/usb_device.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2142726457/usb_device.p1 ../framework/usb/src/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/2142726457/usb_device.d ${OBJECTDIR}/_ext/2142726457/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2142726457/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1: ../framework/usb/src/usb_device_msd.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2142726457" 
	@${RM} ${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1 ../framework/usb/src/usb_device_msd.c 
	@-${MV} ${OBJECTDIR}/_ext/2142726457/usb_device_msd.d ${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1: ../framework/usb/src/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2142726457" 
	@${RM} ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1 ../framework/usb/src/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.d ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/system_config/XPRESS/system.p1: system_config/XPRESS/system.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/system_config/XPRESS" 
	@${RM} ${OBJECTDIR}/system_config/XPRESS/system.p1.d 
	@${RM} ${OBJECTDIR}/system_config/XPRESS/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/system_config/XPRESS/system.p1 system_config/XPRESS/system.c 
	@-${MV} ${OBJECTDIR}/system_config/XPRESS/system.d ${OBJECTDIR}/system_config/XPRESS/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/system_config/XPRESS/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/main.p1 main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/usb_descriptors.p1: usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/usb_descriptors.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/usb_descriptors.p1 usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/usb_descriptors.d ${OBJECTDIR}/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/app_device_msd.p1: app_device_msd.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/app_device_msd.p1.d 
	@${RM} ${OBJECTDIR}/app_device_msd.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/app_device_msd.p1 app_device_msd.c 
	@-${MV} ${OBJECTDIR}/app_device_msd.d ${OBJECTDIR}/app_device_msd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/app_device_msd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/files.p1: files.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/files.p1.d 
	@${RM} ${OBJECTDIR}/files.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/files.p1 files.c 
	@-${MV} ${OBJECTDIR}/files.d ${OBJECTDIR}/files.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/files.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/direct.p1: direct.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/direct.p1.d 
	@${RM} ${OBJECTDIR}/direct.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/direct.p1 direct.c 
	@-${MV} ${OBJECTDIR}/direct.d ${OBJECTDIR}/direct.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/direct.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/lvp.p1: lvp.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/lvp.p1.d 
	@${RM} ${OBJECTDIR}/lvp.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/lvp.p1 lvp.c 
	@-${MV} ${OBJECTDIR}/lvp.d ${OBJECTDIR}/lvp.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/lvp.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/app_device_cdc.p1: app_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/app_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/app_device_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/app_device_cdc.p1 app_device_cdc.c 
	@-${MV} ${OBJECTDIR}/app_device_cdc.d ${OBJECTDIR}/app_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/app_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1371762614/buttons.p1: ../bsp/xpress/buttons.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1371762614" 
	@${RM} ${OBJECTDIR}/_ext/1371762614/buttons.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1371762614/buttons.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1371762614/buttons.p1 ../bsp/xpress/buttons.c 
	@-${MV} ${OBJECTDIR}/_ext/1371762614/buttons.d ${OBJECTDIR}/_ext/1371762614/buttons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1371762614/buttons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1371762614/leds.p1: ../bsp/xpress/leds.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1371762614" 
	@${RM} ${OBJECTDIR}/_ext/1371762614/leds.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1371762614/leds.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1371762614/leds.p1 ../bsp/xpress/leds.c 
	@-${MV} ${OBJECTDIR}/_ext/1371762614/leds.d ${OBJECTDIR}/_ext/1371762614/leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1371762614/leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1371762614/uart.p1: ../bsp/xpress/uart.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1371762614" 
	@${RM} ${OBJECTDIR}/_ext/1371762614/uart.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1371762614/uart.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1371762614/uart.p1 ../bsp/xpress/uart.c 
	@-${MV} ${OBJECTDIR}/_ext/1371762614/uart.d ${OBJECTDIR}/_ext/1371762614/uart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1371762614/uart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2142726457/usb_device.p1: ../framework/usb/src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2142726457" 
	@${RM} ${OBJECTDIR}/_ext/2142726457/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2142726457/usb_device.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2142726457/usb_device.p1 ../framework/usb/src/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/2142726457/usb_device.d ${OBJECTDIR}/_ext/2142726457/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2142726457/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1: ../framework/usb/src/usb_device_msd.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2142726457" 
	@${RM} ${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1 ../framework/usb/src/usb_device_msd.c 
	@-${MV} ${OBJECTDIR}/_ext/2142726457/usb_device_msd.d ${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2142726457/usb_device_msd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1: ../framework/usb/src/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2142726457" 
	@${RM} ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -DXPRJ_XPRESS=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1 ../framework/usb/src/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.d ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2142726457/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/MPLAB.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -mdebugger=none  -DXPRJ_XPRESS=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/MPLAB.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} ${DISTDIR}/MPLAB.X.${IMAGE_TYPE}.hex 
	
	
else
${DISTDIR}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/MPLAB.X.${IMAGE_TYPE}.map  -DXPRJ_XPRESS=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=require -xassembler-with-cpp -I"." -I"../framework/usb/inc" -I"../bsp/xpress" -I"system_config/xpress" -I"../framework" -I"../framework/fileio/inc" -mwarn=0 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file -mcodeoffset=0x1000  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/MPLAB.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
