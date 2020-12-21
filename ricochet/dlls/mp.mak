# Microsoft Developer Studio Generated NMAKE File, Based on mp.dsp
!IF "$(CFG)" == ""
CFG=mp - Win32 Release
!MESSAGE No configuration specified. Defaulting to mp - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "mp - Win32 Release" && "$(CFG)" != "mp - Win32 Debug" && "$(CFG)" != "mp - Win32 Profile"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "mp.mak" CFG="mp - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "mp - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "mp - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "mp - Win32 Profile" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "mp - Win32 Release"

OUTDIR=.\Releasemp
INTDIR=.\Releasemp
# Begin Custom Macros
OutDir=.\Releasemp
# End Custom Macros

ALL : "$(OUTDIR)\mp.dll"


CLEAN :
	-@erase "$(INTDIR)\airtank.obj"
	-@erase "$(INTDIR)\animating.obj"
	-@erase "$(INTDIR)\animation.obj"
	-@erase "$(INTDIR)\bmodels.obj"
	-@erase "$(INTDIR)\buttons.obj"
	-@erase "$(INTDIR)\cbase.obj"
	-@erase "$(INTDIR)\client.obj"
	-@erase "$(INTDIR)\combat.obj"
	-@erase "$(INTDIR)\disc_arena.obj"
	-@erase "$(INTDIR)\disc_powerups.obj"
	-@erase "$(INTDIR)\disc_weapon_disc.obj"
	-@erase "$(INTDIR)\doors.obj"
	-@erase "$(INTDIR)\effects.obj"
	-@erase "$(INTDIR)\explode.obj"
	-@erase "$(INTDIR)\func_break.obj"
	-@erase "$(INTDIR)\func_tank.obj"
	-@erase "$(INTDIR)\game.obj"
	-@erase "$(INTDIR)\gamerules.obj"
	-@erase "$(INTDIR)\ggrenade.obj"
	-@erase "$(INTDIR)\globals.obj"
	-@erase "$(INTDIR)\h_ai.obj"
	-@erase "$(INTDIR)\h_battery.obj"
	-@erase "$(INTDIR)\h_cycler.obj"
	-@erase "$(INTDIR)\h_export.obj"
	-@erase "$(INTDIR)\healthkit.obj"
	-@erase "$(INTDIR)\items.obj"
	-@erase "$(INTDIR)\lights.obj"
	-@erase "$(INTDIR)\maprules.obj"
	-@erase "$(INTDIR)\mortar.obj"
	-@erase "$(INTDIR)\mpstubb.obj"
	-@erase "$(INTDIR)\multiplay_gamerules.obj"
	-@erase "$(INTDIR)\observer.obj"
	-@erase "$(INTDIR)\pathcorner.obj"
	-@erase "$(INTDIR)\plane.obj"
	-@erase "$(INTDIR)\plats.obj"
	-@erase "$(INTDIR)\player.obj"
	-@erase "$(INTDIR)\pm_debug.obj"
	-@erase "$(INTDIR)\pm_math.obj"
	-@erase "$(INTDIR)\pm_shared.obj"
	-@erase "$(INTDIR)\singleplay_gamerules.obj"
	-@erase "$(INTDIR)\skill.obj"
	-@erase "$(INTDIR)\sound.obj"
	-@erase "$(INTDIR)\soundent.obj"
	-@erase "$(INTDIR)\spectator.obj"
	-@erase "$(INTDIR)\subs.obj"
	-@erase "$(INTDIR)\teamplay_gamerules.obj"
	-@erase "$(INTDIR)\triggers.obj"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice_gamemgr.obj"
	-@erase "$(INTDIR)\weapons.obj"
	-@erase "$(INTDIR)\world.obj"
	-@erase "$(INTDIR)\xen.obj"
	-@erase "$(OUTDIR)\mp.dll"
	-@erase "$(OUTDIR)\mp.exp"
	-@erase "$(OUTDIR)\mp.lib"
	-@erase "$(OUTDIR)\mp.map"
	-@erase "$(OUTDIR)\mp.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /G5 /MT /W3 /GX /Zi /O2 /I "..\dlls" /I "..\..\engine" /I "..\..\common" /I "..\..\game_shared" /I "..\pm_shared" /I "..\\" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "VALVE_DLL" /Fp"$(INTDIR)\mp.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mp.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\mp.pdb" /map:"$(INTDIR)\mp.map" /debug /machine:I386 /def:".\mp.def" /out:"$(OUTDIR)\mp.dll" /implib:"$(OUTDIR)\mp.lib" 
LINK32_OBJS= \
	"$(INTDIR)\airtank.obj" \
	"$(INTDIR)\animating.obj" \
	"$(INTDIR)\animation.obj" \
	"$(INTDIR)\bmodels.obj" \
	"$(INTDIR)\buttons.obj" \
	"$(INTDIR)\cbase.obj" \
	"$(INTDIR)\client.obj" \
	"$(INTDIR)\combat.obj" \
	"$(INTDIR)\disc_arena.obj" \
	"$(INTDIR)\disc_powerups.obj" \
	"$(INTDIR)\disc_weapon_disc.obj" \
	"$(INTDIR)\doors.obj" \
	"$(INTDIR)\effects.obj" \
	"$(INTDIR)\explode.obj" \
	"$(INTDIR)\func_break.obj" \
	"$(INTDIR)\func_tank.obj" \
	"$(INTDIR)\game.obj" \
	"$(INTDIR)\gamerules.obj" \
	"$(INTDIR)\ggrenade.obj" \
	"$(INTDIR)\globals.obj" \
	"$(INTDIR)\h_ai.obj" \
	"$(INTDIR)\h_battery.obj" \
	"$(INTDIR)\h_cycler.obj" \
	"$(INTDIR)\h_export.obj" \
	"$(INTDIR)\healthkit.obj" \
	"$(INTDIR)\items.obj" \
	"$(INTDIR)\lights.obj" \
	"$(INTDIR)\maprules.obj" \
	"$(INTDIR)\mortar.obj" \
	"$(INTDIR)\mpstubb.obj" \
	"$(INTDIR)\multiplay_gamerules.obj" \
	"$(INTDIR)\observer.obj" \
	"$(INTDIR)\pathcorner.obj" \
	"$(INTDIR)\plane.obj" \
	"$(INTDIR)\plats.obj" \
	"$(INTDIR)\player.obj" \
	"$(INTDIR)\pm_debug.obj" \
	"$(INTDIR)\pm_math.obj" \
	"$(INTDIR)\pm_shared.obj" \
	"$(INTDIR)\singleplay_gamerules.obj" \
	"$(INTDIR)\skill.obj" \
	"$(INTDIR)\sound.obj" \
	"$(INTDIR)\soundent.obj" \
	"$(INTDIR)\spectator.obj" \
	"$(INTDIR)\subs.obj" \
	"$(INTDIR)\teamplay_gamerules.obj" \
	"$(INTDIR)\triggers.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\voice_gamemgr.obj" \
	"$(INTDIR)\weapons.obj" \
	"$(INTDIR)\world.obj" \
	"$(INTDIR)\xen.obj"

"$(OUTDIR)\mp.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "mp - Win32 Debug"

OUTDIR=.\debugmp
INTDIR=.\debugmp
# Begin Custom Macros
OutDir=.\debugmp
# End Custom Macros

ALL : "$(OUTDIR)\mp.dll" "$(OUTDIR)\mp.bsc"


CLEAN :
	-@erase "$(INTDIR)\airtank.obj"
	-@erase "$(INTDIR)\airtank.sbr"
	-@erase "$(INTDIR)\animating.obj"
	-@erase "$(INTDIR)\animating.sbr"
	-@erase "$(INTDIR)\animation.obj"
	-@erase "$(INTDIR)\animation.sbr"
	-@erase "$(INTDIR)\bmodels.obj"
	-@erase "$(INTDIR)\bmodels.sbr"
	-@erase "$(INTDIR)\buttons.obj"
	-@erase "$(INTDIR)\buttons.sbr"
	-@erase "$(INTDIR)\cbase.obj"
	-@erase "$(INTDIR)\cbase.sbr"
	-@erase "$(INTDIR)\client.obj"
	-@erase "$(INTDIR)\client.sbr"
	-@erase "$(INTDIR)\combat.obj"
	-@erase "$(INTDIR)\combat.sbr"
	-@erase "$(INTDIR)\disc_arena.obj"
	-@erase "$(INTDIR)\disc_arena.sbr"
	-@erase "$(INTDIR)\disc_powerups.obj"
	-@erase "$(INTDIR)\disc_powerups.sbr"
	-@erase "$(INTDIR)\disc_weapon_disc.obj"
	-@erase "$(INTDIR)\disc_weapon_disc.sbr"
	-@erase "$(INTDIR)\doors.obj"
	-@erase "$(INTDIR)\doors.sbr"
	-@erase "$(INTDIR)\effects.obj"
	-@erase "$(INTDIR)\effects.sbr"
	-@erase "$(INTDIR)\explode.obj"
	-@erase "$(INTDIR)\explode.sbr"
	-@erase "$(INTDIR)\func_break.obj"
	-@erase "$(INTDIR)\func_break.sbr"
	-@erase "$(INTDIR)\func_tank.obj"
	-@erase "$(INTDIR)\func_tank.sbr"
	-@erase "$(INTDIR)\game.obj"
	-@erase "$(INTDIR)\game.sbr"
	-@erase "$(INTDIR)\gamerules.obj"
	-@erase "$(INTDIR)\gamerules.sbr"
	-@erase "$(INTDIR)\ggrenade.obj"
	-@erase "$(INTDIR)\ggrenade.sbr"
	-@erase "$(INTDIR)\globals.obj"
	-@erase "$(INTDIR)\globals.sbr"
	-@erase "$(INTDIR)\h_ai.obj"
	-@erase "$(INTDIR)\h_ai.sbr"
	-@erase "$(INTDIR)\h_battery.obj"
	-@erase "$(INTDIR)\h_battery.sbr"
	-@erase "$(INTDIR)\h_cycler.obj"
	-@erase "$(INTDIR)\h_cycler.sbr"
	-@erase "$(INTDIR)\h_export.obj"
	-@erase "$(INTDIR)\h_export.sbr"
	-@erase "$(INTDIR)\healthkit.obj"
	-@erase "$(INTDIR)\healthkit.sbr"
	-@erase "$(INTDIR)\items.obj"
	-@erase "$(INTDIR)\items.sbr"
	-@erase "$(INTDIR)\lights.obj"
	-@erase "$(INTDIR)\lights.sbr"
	-@erase "$(INTDIR)\maprules.obj"
	-@erase "$(INTDIR)\maprules.sbr"
	-@erase "$(INTDIR)\mortar.obj"
	-@erase "$(INTDIR)\mortar.sbr"
	-@erase "$(INTDIR)\mpstubb.obj"
	-@erase "$(INTDIR)\mpstubb.sbr"
	-@erase "$(INTDIR)\multiplay_gamerules.obj"
	-@erase "$(INTDIR)\multiplay_gamerules.sbr"
	-@erase "$(INTDIR)\observer.obj"
	-@erase "$(INTDIR)\observer.sbr"
	-@erase "$(INTDIR)\pathcorner.obj"
	-@erase "$(INTDIR)\pathcorner.sbr"
	-@erase "$(INTDIR)\plane.obj"
	-@erase "$(INTDIR)\plane.sbr"
	-@erase "$(INTDIR)\plats.obj"
	-@erase "$(INTDIR)\plats.sbr"
	-@erase "$(INTDIR)\player.obj"
	-@erase "$(INTDIR)\player.sbr"
	-@erase "$(INTDIR)\pm_debug.obj"
	-@erase "$(INTDIR)\pm_debug.sbr"
	-@erase "$(INTDIR)\pm_math.obj"
	-@erase "$(INTDIR)\pm_math.sbr"
	-@erase "$(INTDIR)\pm_shared.obj"
	-@erase "$(INTDIR)\pm_shared.sbr"
	-@erase "$(INTDIR)\singleplay_gamerules.obj"
	-@erase "$(INTDIR)\singleplay_gamerules.sbr"
	-@erase "$(INTDIR)\skill.obj"
	-@erase "$(INTDIR)\skill.sbr"
	-@erase "$(INTDIR)\sound.obj"
	-@erase "$(INTDIR)\sound.sbr"
	-@erase "$(INTDIR)\soundent.obj"
	-@erase "$(INTDIR)\soundent.sbr"
	-@erase "$(INTDIR)\spectator.obj"
	-@erase "$(INTDIR)\spectator.sbr"
	-@erase "$(INTDIR)\subs.obj"
	-@erase "$(INTDIR)\subs.sbr"
	-@erase "$(INTDIR)\teamplay_gamerules.obj"
	-@erase "$(INTDIR)\teamplay_gamerules.sbr"
	-@erase "$(INTDIR)\triggers.obj"
	-@erase "$(INTDIR)\triggers.sbr"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\util.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice_gamemgr.obj"
	-@erase "$(INTDIR)\voice_gamemgr.sbr"
	-@erase "$(INTDIR)\weapons.obj"
	-@erase "$(INTDIR)\weapons.sbr"
	-@erase "$(INTDIR)\world.obj"
	-@erase "$(INTDIR)\world.sbr"
	-@erase "$(INTDIR)\xen.obj"
	-@erase "$(INTDIR)\xen.sbr"
	-@erase "$(OUTDIR)\mp.bsc"
	-@erase "$(OUTDIR)\mp.dll"
	-@erase "$(OUTDIR)\mp.ilk"
	-@erase "$(OUTDIR)\mp.pdb"
	-@erase ".\Debug\mp.exp"
	-@erase ".\Debug\mp.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /G5 /MTd /W3 /Gm /GX /ZI /Od /I "..\dlls" /I "..\..\engine" /I "..\..\common" /I "..\..\game_shared" /I "..\pm_shared" /I "..\\" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "VALVE_DLL" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\mp.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mp.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\airtank.sbr" \
	"$(INTDIR)\animating.sbr" \
	"$(INTDIR)\animation.sbr" \
	"$(INTDIR)\bmodels.sbr" \
	"$(INTDIR)\buttons.sbr" \
	"$(INTDIR)\cbase.sbr" \
	"$(INTDIR)\client.sbr" \
	"$(INTDIR)\combat.sbr" \
	"$(INTDIR)\disc_arena.sbr" \
	"$(INTDIR)\disc_powerups.sbr" \
	"$(INTDIR)\disc_weapon_disc.sbr" \
	"$(INTDIR)\doors.sbr" \
	"$(INTDIR)\effects.sbr" \
	"$(INTDIR)\explode.sbr" \
	"$(INTDIR)\func_break.sbr" \
	"$(INTDIR)\func_tank.sbr" \
	"$(INTDIR)\game.sbr" \
	"$(INTDIR)\gamerules.sbr" \
	"$(INTDIR)\ggrenade.sbr" \
	"$(INTDIR)\globals.sbr" \
	"$(INTDIR)\h_ai.sbr" \
	"$(INTDIR)\h_battery.sbr" \
	"$(INTDIR)\h_cycler.sbr" \
	"$(INTDIR)\h_export.sbr" \
	"$(INTDIR)\healthkit.sbr" \
	"$(INTDIR)\items.sbr" \
	"$(INTDIR)\lights.sbr" \
	"$(INTDIR)\maprules.sbr" \
	"$(INTDIR)\mortar.sbr" \
	"$(INTDIR)\mpstubb.sbr" \
	"$(INTDIR)\multiplay_gamerules.sbr" \
	"$(INTDIR)\observer.sbr" \
	"$(INTDIR)\pathcorner.sbr" \
	"$(INTDIR)\plane.sbr" \
	"$(INTDIR)\plats.sbr" \
	"$(INTDIR)\player.sbr" \
	"$(INTDIR)\pm_debug.sbr" \
	"$(INTDIR)\pm_math.sbr" \
	"$(INTDIR)\pm_shared.sbr" \
	"$(INTDIR)\singleplay_gamerules.sbr" \
	"$(INTDIR)\skill.sbr" \
	"$(INTDIR)\sound.sbr" \
	"$(INTDIR)\soundent.sbr" \
	"$(INTDIR)\spectator.sbr" \
	"$(INTDIR)\subs.sbr" \
	"$(INTDIR)\teamplay_gamerules.sbr" \
	"$(INTDIR)\triggers.sbr" \
	"$(INTDIR)\util.sbr" \
	"$(INTDIR)\voice_gamemgr.sbr" \
	"$(INTDIR)\weapons.sbr" \
	"$(INTDIR)\world.sbr" \
	"$(INTDIR)\xen.sbr"

"$(OUTDIR)\mp.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=user32.lib advapi32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\mp.pdb" /debug /machine:I386 /def:".\mp.def" /out:"$(OUTDIR)\mp.dll" /implib:".\Debug\mp.lib" 
LINK32_OBJS= \
	"$(INTDIR)\airtank.obj" \
	"$(INTDIR)\animating.obj" \
	"$(INTDIR)\animation.obj" \
	"$(INTDIR)\bmodels.obj" \
	"$(INTDIR)\buttons.obj" \
	"$(INTDIR)\cbase.obj" \
	"$(INTDIR)\client.obj" \
	"$(INTDIR)\combat.obj" \
	"$(INTDIR)\disc_arena.obj" \
	"$(INTDIR)\disc_powerups.obj" \
	"$(INTDIR)\disc_weapon_disc.obj" \
	"$(INTDIR)\doors.obj" \
	"$(INTDIR)\effects.obj" \
	"$(INTDIR)\explode.obj" \
	"$(INTDIR)\func_break.obj" \
	"$(INTDIR)\func_tank.obj" \
	"$(INTDIR)\game.obj" \
	"$(INTDIR)\gamerules.obj" \
	"$(INTDIR)\ggrenade.obj" \
	"$(INTDIR)\globals.obj" \
	"$(INTDIR)\h_ai.obj" \
	"$(INTDIR)\h_battery.obj" \
	"$(INTDIR)\h_cycler.obj" \
	"$(INTDIR)\h_export.obj" \
	"$(INTDIR)\healthkit.obj" \
	"$(INTDIR)\items.obj" \
	"$(INTDIR)\lights.obj" \
	"$(INTDIR)\maprules.obj" \
	"$(INTDIR)\mortar.obj" \
	"$(INTDIR)\mpstubb.obj" \
	"$(INTDIR)\multiplay_gamerules.obj" \
	"$(INTDIR)\observer.obj" \
	"$(INTDIR)\pathcorner.obj" \
	"$(INTDIR)\plane.obj" \
	"$(INTDIR)\plats.obj" \
	"$(INTDIR)\player.obj" \
	"$(INTDIR)\pm_debug.obj" \
	"$(INTDIR)\pm_math.obj" \
	"$(INTDIR)\pm_shared.obj" \
	"$(INTDIR)\singleplay_gamerules.obj" \
	"$(INTDIR)\skill.obj" \
	"$(INTDIR)\sound.obj" \
	"$(INTDIR)\soundent.obj" \
	"$(INTDIR)\spectator.obj" \
	"$(INTDIR)\subs.obj" \
	"$(INTDIR)\teamplay_gamerules.obj" \
	"$(INTDIR)\triggers.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\voice_gamemgr.obj" \
	"$(INTDIR)\weapons.obj" \
	"$(INTDIR)\world.obj" \
	"$(INTDIR)\xen.obj"

"$(OUTDIR)\mp.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "mp - Win32 Profile"

OUTDIR=.\Profilemp
INTDIR=.\Profilemp
# Begin Custom Macros
OutDir=.\Profilemp
# End Custom Macros

ALL : "$(OUTDIR)\mp.dll"


CLEAN :
	-@erase "$(INTDIR)\airtank.obj"
	-@erase "$(INTDIR)\animating.obj"
	-@erase "$(INTDIR)\animation.obj"
	-@erase "$(INTDIR)\bmodels.obj"
	-@erase "$(INTDIR)\buttons.obj"
	-@erase "$(INTDIR)\cbase.obj"
	-@erase "$(INTDIR)\client.obj"
	-@erase "$(INTDIR)\combat.obj"
	-@erase "$(INTDIR)\disc_arena.obj"
	-@erase "$(INTDIR)\disc_powerups.obj"
	-@erase "$(INTDIR)\disc_weapon_disc.obj"
	-@erase "$(INTDIR)\doors.obj"
	-@erase "$(INTDIR)\effects.obj"
	-@erase "$(INTDIR)\explode.obj"
	-@erase "$(INTDIR)\func_break.obj"
	-@erase "$(INTDIR)\func_tank.obj"
	-@erase "$(INTDIR)\game.obj"
	-@erase "$(INTDIR)\gamerules.obj"
	-@erase "$(INTDIR)\ggrenade.obj"
	-@erase "$(INTDIR)\globals.obj"
	-@erase "$(INTDIR)\h_ai.obj"
	-@erase "$(INTDIR)\h_battery.obj"
	-@erase "$(INTDIR)\h_cycler.obj"
	-@erase "$(INTDIR)\h_export.obj"
	-@erase "$(INTDIR)\healthkit.obj"
	-@erase "$(INTDIR)\items.obj"
	-@erase "$(INTDIR)\lights.obj"
	-@erase "$(INTDIR)\maprules.obj"
	-@erase "$(INTDIR)\mortar.obj"
	-@erase "$(INTDIR)\mpstubb.obj"
	-@erase "$(INTDIR)\multiplay_gamerules.obj"
	-@erase "$(INTDIR)\observer.obj"
	-@erase "$(INTDIR)\pathcorner.obj"
	-@erase "$(INTDIR)\plane.obj"
	-@erase "$(INTDIR)\plats.obj"
	-@erase "$(INTDIR)\player.obj"
	-@erase "$(INTDIR)\pm_debug.obj"
	-@erase "$(INTDIR)\pm_math.obj"
	-@erase "$(INTDIR)\pm_shared.obj"
	-@erase "$(INTDIR)\singleplay_gamerules.obj"
	-@erase "$(INTDIR)\skill.obj"
	-@erase "$(INTDIR)\sound.obj"
	-@erase "$(INTDIR)\soundent.obj"
	-@erase "$(INTDIR)\spectator.obj"
	-@erase "$(INTDIR)\subs.obj"
	-@erase "$(INTDIR)\teamplay_gamerules.obj"
	-@erase "$(INTDIR)\triggers.obj"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice_gamemgr.obj"
	-@erase "$(INTDIR)\weapons.obj"
	-@erase "$(INTDIR)\world.obj"
	-@erase "$(INTDIR)\xen.obj"
	-@erase "$(OUTDIR)\mp.dll"
	-@erase "$(OUTDIR)\mp.exp"
	-@erase "$(OUTDIR)\mp.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /G5 /MT /W3 /GX /Zi /O2 /I "..\dlls" /I "..\engine" /I "..\..\game_shared" /I "..\common" /I "..\pm_shared" /I "..\\" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "VALVE_DLL" /Fp"$(INTDIR)\mp.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mp.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /profile /debug /machine:I386 /def:".\mp.def" /out:"$(OUTDIR)\mp.dll" /implib:"$(OUTDIR)\mp.lib" 
LINK32_OBJS= \
	"$(INTDIR)\airtank.obj" \
	"$(INTDIR)\animating.obj" \
	"$(INTDIR)\animation.obj" \
	"$(INTDIR)\bmodels.obj" \
	"$(INTDIR)\buttons.obj" \
	"$(INTDIR)\cbase.obj" \
	"$(INTDIR)\client.obj" \
	"$(INTDIR)\combat.obj" \
	"$(INTDIR)\disc_arena.obj" \
	"$(INTDIR)\disc_powerups.obj" \
	"$(INTDIR)\disc_weapon_disc.obj" \
	"$(INTDIR)\doors.obj" \
	"$(INTDIR)\effects.obj" \
	"$(INTDIR)\explode.obj" \
	"$(INTDIR)\func_break.obj" \
	"$(INTDIR)\func_tank.obj" \
	"$(INTDIR)\game.obj" \
	"$(INTDIR)\gamerules.obj" \
	"$(INTDIR)\ggrenade.obj" \
	"$(INTDIR)\globals.obj" \
	"$(INTDIR)\h_ai.obj" \
	"$(INTDIR)\h_battery.obj" \
	"$(INTDIR)\h_cycler.obj" \
	"$(INTDIR)\h_export.obj" \
	"$(INTDIR)\healthkit.obj" \
	"$(INTDIR)\items.obj" \
	"$(INTDIR)\lights.obj" \
	"$(INTDIR)\maprules.obj" \
	"$(INTDIR)\mortar.obj" \
	"$(INTDIR)\mpstubb.obj" \
	"$(INTDIR)\multiplay_gamerules.obj" \
	"$(INTDIR)\observer.obj" \
	"$(INTDIR)\pathcorner.obj" \
	"$(INTDIR)\plane.obj" \
	"$(INTDIR)\plats.obj" \
	"$(INTDIR)\player.obj" \
	"$(INTDIR)\pm_debug.obj" \
	"$(INTDIR)\pm_math.obj" \
	"$(INTDIR)\pm_shared.obj" \
	"$(INTDIR)\singleplay_gamerules.obj" \
	"$(INTDIR)\skill.obj" \
	"$(INTDIR)\sound.obj" \
	"$(INTDIR)\soundent.obj" \
	"$(INTDIR)\spectator.obj" \
	"$(INTDIR)\subs.obj" \
	"$(INTDIR)\teamplay_gamerules.obj" \
	"$(INTDIR)\triggers.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\voice_gamemgr.obj" \
	"$(INTDIR)\weapons.obj" \
	"$(INTDIR)\world.obj" \
	"$(INTDIR)\xen.obj"

"$(OUTDIR)\mp.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("mp.dep")
!INCLUDE "mp.dep"
!ELSE 
!MESSAGE Warning: cannot find "mp.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "mp - Win32 Release" || "$(CFG)" == "mp - Win32 Debug" || "$(CFG)" == "mp - Win32 Profile"
SOURCE=.\airtank.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\airtank.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\airtank.obj"	"$(INTDIR)\airtank.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\airtank.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\animating.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\animating.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\animating.obj"	"$(INTDIR)\animating.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\animating.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\animation.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\animation.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\animation.obj"	"$(INTDIR)\animation.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\animation.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\bmodels.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\bmodels.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\bmodels.obj"	"$(INTDIR)\bmodels.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\bmodels.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\buttons.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\buttons.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\buttons.obj"	"$(INTDIR)\buttons.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\buttons.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\cbase.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\cbase.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\cbase.obj"	"$(INTDIR)\cbase.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\cbase.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\client.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\client.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\client.obj"	"$(INTDIR)\client.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\client.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\combat.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\combat.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\combat.obj"	"$(INTDIR)\combat.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\combat.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\disc_arena.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\disc_arena.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\disc_arena.obj"	"$(INTDIR)\disc_arena.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\disc_arena.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\disc_powerups.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\disc_powerups.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\disc_powerups.obj"	"$(INTDIR)\disc_powerups.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\disc_powerups.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\wpn_shared\disc_weapon_disc.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\disc_weapon_disc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\disc_weapon_disc.obj"	"$(INTDIR)\disc_weapon_disc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\disc_weapon_disc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\doors.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\doors.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\doors.obj"	"$(INTDIR)\doors.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\doors.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\effects.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\effects.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\effects.obj"	"$(INTDIR)\effects.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\effects.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\explode.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\explode.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\explode.obj"	"$(INTDIR)\explode.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\explode.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\func_break.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\func_break.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\func_break.obj"	"$(INTDIR)\func_break.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\func_break.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\func_tank.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\func_tank.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\func_tank.obj"	"$(INTDIR)\func_tank.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\func_tank.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\game.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\game.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\game.obj"	"$(INTDIR)\game.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\game.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\gamerules.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\gamerules.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\gamerules.obj"	"$(INTDIR)\gamerules.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\gamerules.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\ggrenade.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\ggrenade.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\ggrenade.obj"	"$(INTDIR)\ggrenade.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\ggrenade.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\globals.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\globals.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\globals.obj"	"$(INTDIR)\globals.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\globals.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\h_ai.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\h_ai.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\h_ai.obj"	"$(INTDIR)\h_ai.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\h_ai.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\h_battery.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\h_battery.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\h_battery.obj"	"$(INTDIR)\h_battery.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\h_battery.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\h_cycler.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\h_cycler.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\h_cycler.obj"	"$(INTDIR)\h_cycler.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\h_cycler.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\h_export.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\h_export.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\h_export.obj"	"$(INTDIR)\h_export.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\h_export.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\healthkit.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\healthkit.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\healthkit.obj"	"$(INTDIR)\healthkit.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\healthkit.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\items.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\items.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\items.obj"	"$(INTDIR)\items.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\items.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\lights.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\lights.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\lights.obj"	"$(INTDIR)\lights.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\lights.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\maprules.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\maprules.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\maprules.obj"	"$(INTDIR)\maprules.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\maprules.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\mortar.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\mortar.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\mortar.obj"	"$(INTDIR)\mortar.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\mortar.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\mpstubb.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\mpstubb.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\mpstubb.obj"	"$(INTDIR)\mpstubb.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\mpstubb.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\multiplay_gamerules.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\multiplay_gamerules.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\multiplay_gamerules.obj"	"$(INTDIR)\multiplay_gamerules.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\multiplay_gamerules.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\observer.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\observer.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\observer.obj"	"$(INTDIR)\observer.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\observer.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\pathcorner.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\pathcorner.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\pathcorner.obj"	"$(INTDIR)\pathcorner.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\pathcorner.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\plane.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\plane.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\plane.obj"	"$(INTDIR)\plane.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\plane.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\plats.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\plats.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\plats.obj"	"$(INTDIR)\plats.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\plats.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\player.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\player.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\player.obj"	"$(INTDIR)\player.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\player.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=..\pm_shared\pm_debug.c

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\pm_debug.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\pm_debug.obj"	"$(INTDIR)\pm_debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\pm_debug.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\pm_shared\pm_math.c

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\pm_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\pm_math.obj"	"$(INTDIR)\pm_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\pm_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\pm_shared\pm_shared.c

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\pm_shared.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\pm_shared.obj"	"$(INTDIR)\pm_shared.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\pm_shared.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\singleplay_gamerules.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\singleplay_gamerules.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\singleplay_gamerules.obj"	"$(INTDIR)\singleplay_gamerules.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\singleplay_gamerules.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\skill.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\skill.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\skill.obj"	"$(INTDIR)\skill.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\skill.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\sound.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\sound.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\sound.obj"	"$(INTDIR)\sound.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\sound.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\soundent.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\soundent.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\soundent.obj"	"$(INTDIR)\soundent.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\soundent.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\spectator.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\spectator.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\spectator.obj"	"$(INTDIR)\spectator.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\spectator.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\subs.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\subs.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\subs.obj"	"$(INTDIR)\subs.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\subs.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\teamplay_gamerules.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\teamplay_gamerules.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\teamplay_gamerules.obj"	"$(INTDIR)\teamplay_gamerules.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\teamplay_gamerules.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\triggers.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\triggers.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\triggers.obj"	"$(INTDIR)\triggers.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\triggers.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\util.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\util.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\util.obj"	"$(INTDIR)\util.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\util.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=..\..\game_shared\voice_gamemgr.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\voice_gamemgr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\voice_gamemgr.obj"	"$(INTDIR)\voice_gamemgr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\voice_gamemgr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\weapons.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\weapons.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\weapons.obj"	"$(INTDIR)\weapons.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\weapons.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\world.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\world.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\world.obj"	"$(INTDIR)\world.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\world.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\xen.cpp

!IF  "$(CFG)" == "mp - Win32 Release"


"$(INTDIR)\xen.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Debug"


"$(INTDIR)\xen.obj"	"$(INTDIR)\xen.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mp - Win32 Profile"


"$(INTDIR)\xen.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 


!ENDIF 

