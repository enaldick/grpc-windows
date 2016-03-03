:: Copyright 2013 <chaishushan{AT}gmail.com>. All rights reserved.
:: Use of this source code is governed by a BSD-style
:: license that can be found in the LICENSE file.

setlocal

cd %~dp0

:: ----------------------------------------------------------------------------

set TARGET=hiuis3-0.0.0.0-win64
for /f "delims=" %%x in (VERSION.txt) do (set TARGET=hiuis3-%%x-win64)

:: ----------------------------------------------------------------------------
:: build ccpkg

call ..\ccpkg\build.bat
cd %~dp0

:: ----------------------------------------------------------------------------
:: Setup MSVC

:: VS2015
if not "x%VS140COMNTOOLS%" == "x" (
	echo Setup VS2015 Win64 ...
	call "%VS140COMNTOOLS%\..\..\VC\vcvarsall.bat" x86_amd64
	goto build
)

:: VS2013
if not "x%VS120COMNTOOLS%" == "x" (
	echo Setup VS2013 Win64 ...
	call "%VS120COMNTOOLS%\..\..\VC\vcvarsall.bat" x86_amd64
	goto build
)

:: VS2012
if not "x%VS110COMNTOOLS%" == "x" (
	echo Setup VS2012 Win64 ...
	call "%VS110COMNTOOLS%\..\..\VC\vcvarsall.bat" x86_amd64
	goto build
)

:: VS2010
if not "x%VS100COMNTOOLS%" == "x" (
	echo Setup VS2010 Win64 ...
	call "%VS100COMNTOOLS%\..\..\VC\vcvarsall.bat" x86_amd64
	goto build
)

:build

:: -----------------------------------------------------------------------------
:: BUG: http://public.kitware.com/Bug/bug_relationship_graph.php?bug_id=14693&graph=relation

del /Q hiuis3.exe

mkdir zz_build_win64_release
cd    zz_build_win64_release

cmake ..^
  -G "NMake Makefiles"^
  -DCMAKE_INSTALL_PREFIX=..^
  -DCMAKE_BUILD_TYPE=release^
  ^
  -DCMAKE_C_FLAGS_DEBUG="/MDd /Zi /Od /Ob0 /RTC1"^
  -DCMAKE_CXX_FLAGS_DEBUG="/MDd /Zi /Od /Ob0 /RTC1"^
  -DCMAKE_C_FLAGS_RELEASE="/MD /O2 /Ob2 /DNDEBUG"^
  -DCMAKE_CXX_FLAGS_RELEASE="/MD /O2 /Ob2 /DNDEBUG"^
  ^
  -DCMAKE_MODULE_LINKER_FLAGS="/MANIFEST:NO /machine:x64"^
  -DCMAKE_SHARED_LINKER_FLAGS="/MANIFEST:NO /machine:x64"^
  -DCMAKE_STATIC_LINKER_FLAGS="/MANIFEST:NO /machine:x64"^
  -DCMAKE_EXE_LINKER_FLAGS="/MANIFEST:NO /MACHINE:x64"

nmake install

cd ..

if not exist hiuis3.exe (
	goto end
)

:: -----------------------------------------------------------------------------
:: pack

mkdir                        %TARGET%
xcopy /S/I example           %TARGET%\example 
xcopy /S/I include           %TARGET%\include
xcopy /S/I testdata          %TARGET%\testdata
copy ..\..\bin\Depends64.exe %TARGET%
copy hiuis3-win64.lib         %TARGET%
copy hiuis3-win64.dll         %TARGET%
copy hiuis3test.exe           %TARGET%
copy hiuis3.exe               %TARGET%
copy hiuis3.ini               %TARGET%
copy README.html             %TARGET%
copy README.md               %TARGET%
copy CHANGELIST.html         %TARGET%
copy CHANGELIST.md           %TARGET%
copy VERSION.txt             %TARGET%

:: make zip
7za a %TARGET%.zip -tzip %TARGET% -y >7za-stdout.txt
del /Q 7za-stdout.txt
rmdir /S/Q %TARGET%

:: remove zip if not hiuis3.exe
if not exist hiuis3.exe (
	del /Q %TARGET%.zip
)

echo hiuis3/build-win64.bat Done

:: -----------------------------------------------------------------------------
:end

