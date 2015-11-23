#############################################################################
# Makefile for building: fraqtive
# Generated by qmake (3.0) (Qt 5.5.1)
# Project:  fraqtive.pro
# Template: subdirs
# Command: c:\Qt\5.5\msvc2013_64\bin\qmake.exe -o Makefile fraqtive.pro
#############################################################################

MAKEFILE      = Makefile

first: make_first
QMAKE         = c:\Qt\5.5\msvc2013_64\bin\qmake.exe
DEL_FILE      = del
CHK_DIR_EXISTS= if not exist
MKDIR         = mkdir
COPY          = copy /y
COPY_FILE     = copy /y
COPY_DIR      = xcopy /s /q /y /i
INSTALL_FILE  = copy /y
INSTALL_PROGRAM = copy /y
INSTALL_DIR   = xcopy /s /q /y /i
DEL_FILE      = del
SYMLINK       = $(QMAKE) -install ln -f -s
DEL_DIR       = rmdir
MOVE          = move
SUBTARGETS    =  \
		sub-src


sub-src-qmake_all:  FORCE
	@if not exist src\ mkdir src\ & if not exist src\ exit 1
	cd src\ && $(QMAKE) D:\git\fraqtive-master\src\src.pro -o Makefile
	@set MAKEFLAGS=$(MAKEFLAGS)
	cd src\ && $(MAKE) -f Makefile qmake_all
sub-src: FORCE
	@if not exist src\ mkdir src\ & if not exist src\ exit 1
	@set MAKEFLAGS=$(MAKEFLAGS)
	cd src\ && ( if not exist Makefile $(QMAKE) D:\git\fraqtive-master\src\src.pro -o Makefile ) && $(MAKE) -f Makefile
sub-src-make_first: FORCE
	@if not exist src\ mkdir src\ & if not exist src\ exit 1
	@set MAKEFLAGS=$(MAKEFLAGS)
	cd src\ && ( if not exist Makefile $(QMAKE) D:\git\fraqtive-master\src\src.pro -o Makefile ) && $(MAKE) -f Makefile 
sub-src-all: FORCE
	@if not exist src\ mkdir src\ & if not exist src\ exit 1
	@set MAKEFLAGS=$(MAKEFLAGS)
	cd src\ && ( if not exist Makefile $(QMAKE) D:\git\fraqtive-master\src\src.pro -o Makefile ) && $(MAKE) -f Makefile all
sub-src-clean: FORCE
	@if not exist src\ mkdir src\ & if not exist src\ exit 1
	@set MAKEFLAGS=$(MAKEFLAGS)
	cd src\ && ( if not exist Makefile $(QMAKE) D:\git\fraqtive-master\src\src.pro -o Makefile ) && $(MAKE) -f Makefile clean
sub-src-distclean: FORCE
	@if not exist src\ mkdir src\ & if not exist src\ exit 1
	@set MAKEFLAGS=$(MAKEFLAGS)
	cd src\ && ( if not exist Makefile $(QMAKE) D:\git\fraqtive-master\src\src.pro -o Makefile ) && $(MAKE) -f Makefile distclean
sub-src-install_subtargets: FORCE
	@if not exist src\ mkdir src\ & if not exist src\ exit 1
	@set MAKEFLAGS=$(MAKEFLAGS)
	cd src\ && ( if not exist Makefile $(QMAKE) D:\git\fraqtive-master\src\src.pro -o Makefile ) && $(MAKE) -f Makefile install
sub-src-uninstall_subtargets: FORCE
	@if not exist src\ mkdir src\ & if not exist src\ exit 1
	@set MAKEFLAGS=$(MAKEFLAGS)
	cd src\ && ( if not exist Makefile $(QMAKE) D:\git\fraqtive-master\src\src.pro -o Makefile ) && $(MAKE) -f Makefile uninstall

Makefile: fraqtive.pro C:\Qt\5.5\msvc2013_64\mkspecs\win32-msvc2013\qmake.conf C:\Qt\5.5\msvc2013_64\mkspecs\features\spec_pre.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\common\msvc-desktop.conf \
		C:\Qt\5.5\msvc2013_64\mkspecs\qconfig.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dcollision.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dcollision_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dcore.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dcore_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dinput.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dinput_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dlogic.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dlogic_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dquick.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dquick_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dquickrenderer.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dquickrenderer_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3drenderer.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3drenderer_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_axbase.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_axbase_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_axcontainer.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_axcontainer_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_axserver.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_axserver_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_bluetooth.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_bluetooth_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_bootstrap_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_clucene_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_concurrent.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_concurrent_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_core.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_core_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_dbus.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_dbus_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_declarative.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_declarative_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_designer.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_designer_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_designercomponents_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_enginio.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_enginio_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_gui.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_gui_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_help.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_help_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_location.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_location_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_multimedia.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_multimedia_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_multimediawidgets.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_multimediawidgets_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_network.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_network_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_nfc.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_nfc_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_opengl.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_opengl_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_openglextensions.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_openglextensions_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_platformsupport_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_positioning.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_positioning_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_printsupport.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_printsupport_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_qml.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_qml_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_qmldevtools_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_qmltest.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_qmltest_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_qtmultimediaquicktools_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_quick.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_quick_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_quickparticles_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_quickwidgets.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_quickwidgets_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_script.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_script_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_scripttools.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_scripttools_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_sensors.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_sensors_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_serialport.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_serialport_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_sql.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_sql_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_svg.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_svg_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_testlib.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_testlib_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_uiplugin.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_uitools.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_uitools_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webchannel.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webchannel_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webengine.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webengine_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webenginecore.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webenginecore_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webenginewidgets.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webenginewidgets_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webkit.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webkit_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webkitwidgets.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webkitwidgets_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_websockets.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_websockets_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webview_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_widgets.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_widgets_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_winextras.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_winextras_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_xml.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_xml_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_xmlpatterns.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_xmlpatterns_private.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\qt_functions.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\qt_config.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\win32\qt_config.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\win32-msvc2013\qmake.conf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\spec_post.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\exclusive_builds.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\default_pre.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\win32\default_pre.prf \
		config.pri \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\resolve_config.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\exclusive_builds_post.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\default_post.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\win32\rtti.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\c++11.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\precompile_header.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\warn_on.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\win32\windows.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\testcase_targets.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\exceptions.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\yacc.prf \
		C:\Qt\5.5\msvc2013_64\mkspecs\features\lex.prf \
		fraqtive.pro
	$(QMAKE) -o Makefile fraqtive.pro
C:\Qt\5.5\msvc2013_64\mkspecs\features\spec_pre.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\common\msvc-desktop.conf:
C:\Qt\5.5\msvc2013_64\mkspecs\qconfig.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dcollision.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dcollision_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dcore.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dcore_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dinput.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dinput_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dlogic.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dlogic_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dquick.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dquick_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dquickrenderer.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3dquickrenderer_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3drenderer.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_3drenderer_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_axbase.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_axbase_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_axcontainer.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_axcontainer_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_axserver.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_axserver_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_bluetooth.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_bluetooth_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_bootstrap_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_clucene_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_concurrent.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_concurrent_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_core.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_core_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_dbus.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_dbus_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_declarative.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_declarative_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_designer.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_designer_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_designercomponents_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_enginio.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_enginio_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_gui.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_gui_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_help.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_help_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_location.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_location_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_multimedia.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_multimedia_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_multimediawidgets.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_multimediawidgets_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_network.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_network_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_nfc.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_nfc_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_opengl.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_opengl_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_openglextensions.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_openglextensions_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_platformsupport_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_positioning.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_positioning_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_printsupport.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_printsupport_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_qml.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_qml_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_qmldevtools_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_qmltest.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_qmltest_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_qtmultimediaquicktools_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_quick.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_quick_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_quickparticles_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_quickwidgets.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_quickwidgets_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_script.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_script_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_scripttools.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_scripttools_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_sensors.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_sensors_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_serialport.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_serialport_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_sql.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_sql_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_svg.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_svg_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_testlib.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_testlib_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_uiplugin.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_uitools.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_uitools_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webchannel.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webchannel_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webengine.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webengine_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webenginecore.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webenginecore_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webenginewidgets.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webenginewidgets_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webkit.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webkit_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webkitwidgets.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webkitwidgets_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_websockets.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_websockets_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_webview_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_widgets.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_widgets_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_winextras.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_winextras_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_xml.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_xml_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_xmlpatterns.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\modules\qt_lib_xmlpatterns_private.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\features\qt_functions.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\qt_config.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\win32\qt_config.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\win32-msvc2013\qmake.conf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\spec_post.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\exclusive_builds.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\default_pre.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\win32\default_pre.prf:
config.pri:
C:\Qt\5.5\msvc2013_64\mkspecs\features\resolve_config.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\exclusive_builds_post.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\default_post.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\win32\rtti.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\c++11.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\precompile_header.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\warn_on.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\win32\windows.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\testcase_targets.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\exceptions.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\yacc.prf:
C:\Qt\5.5\msvc2013_64\mkspecs\features\lex.prf:
fraqtive.pro:
qmake: FORCE
	@$(QMAKE) -o Makefile fraqtive.pro

qmake_all: sub-src-qmake_all FORCE

make_first: sub-src-make_first  FORCE
all: sub-src-all  FORCE
clean: sub-src-clean  FORCE
distclean: sub-src-distclean  FORCE
	-$(DEL_FILE) Makefile
install_subtargets: sub-src-install_subtargets FORCE
uninstall_subtargets: sub-src-uninstall_subtargets FORCE

sub-src-debug:
	@if not exist src\ mkdir src\ & if not exist src\ exit 1
	@set MAKEFLAGS=$(MAKEFLAGS)
	cd src\ && ( if not exist Makefile $(QMAKE) D:\git\fraqtive-master\src\src.pro -o Makefile ) && $(MAKE) -f Makefile debug
debug: sub-src-debug

sub-src-release:
	@if not exist src\ mkdir src\ & if not exist src\ exit 1
	@set MAKEFLAGS=$(MAKEFLAGS)
	cd src\ && ( if not exist Makefile $(QMAKE) D:\git\fraqtive-master\src\src.pro -o Makefile ) && $(MAKE) -f Makefile release
release: sub-src-release

sub-src-check:
	@if not exist src\ mkdir src\ & if not exist src\ exit 1
	@set MAKEFLAGS=$(MAKEFLAGS)
	cd src\ && ( if not exist Makefile $(QMAKE) D:\git\fraqtive-master\src\src.pro -o Makefile ) && $(MAKE) -f Makefile check
check: sub-src-check
install:install_subtargets  FORCE

uninstall: uninstall_subtargets FORCE

FORCE:

