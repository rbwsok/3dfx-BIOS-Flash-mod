rem wmake /s /nologo
DEL flash.exe
echo off
WPP386 -bt=dos -w4 -e25 -zq -otexan -d1 -mf -5r main.cpp
if errorlevel 1 goto error
WPP386 -bt=dos -w4 -e25 -zq -otexan -d1 -mf -5r user.cpp
if errorlevel 1 goto error
WPP386 -bt=dos -w4 -e25 -zq -otexan -d1 -mf -5r rom.cpp
if errorlevel 1 goto error
WPP386 -bt=dos -w4 -e25 -zq -otexan -d1 -mf -5r util.cpp
if errorlevel 1 goto error
WPP386 -bt=dos -w4 -e25 -zq -otexan -d1 -mf -5r data.cpp
if errorlevel 1 goto error
WPP386 -bt=dos -w4 -e25 -zq -otexan -d1 -mf -5r pciinfo.cpp
if errorlevel 1 goto error

WLINK NAME flash SYSTEM DOS4G op m op st=8192 op maxe=25 op q op symf FILE main.obj,user.obj,rom.obj,util.obj,data.obj,pciinfo.obj
if errorlevel 1 goto error
DEL *.OBJ
:error
