:: Copyright 2015 <chaishushan{AT}gmail.com>. All rights reserved.
:: Use of this source code is governed by a BSD-style
:: license that can be found in the LICENSE file.

setlocal

cd %~dp0

:: ----------------------------------------------------------------------------
:: Setup MSVC
:: ----------------------------------------------------------------------------

:: VS2015
if not "x%VS140COMNTOOLS%" == "x" (
	echo Setup VS2015 Win32 ...
	call "%VS140COMNTOOLS%\..\..\VC\vcvarsall.bat"
	goto build
)

:: VS2013
if not "x%VS120COMNTOOLS%" == "x" (
	echo Setup VS2013 Win32 ...
	call "%VS120COMNTOOLS%\..\..\VC\vcvarsall.bat"
	goto build
)

:: VS2012
if not "x%VS110COMNTOOLS%" == "x" (
	echo Setup VS2012 Win32 ...
	call "%VS110COMNTOOLS%\..\..\VC\vcvarsall.bat"
	goto build
)

:: VS2010
if not "x%VS100COMNTOOLS%" == "x" (
	echo Setup VS2010 Win32 ...
	call "%VS100COMNTOOLS%\..\..\VC\vcvarsall.bat"
	goto build
)

goto end

:build

:: ----------------------------------------------------------------------------
:: build
:: ----------------------------------------------------------------------------

set TARGET=%~dp0\openssl-win32
mkdir %TARGET%

cd %~dp0\openssl-1.0.2f
perl Configure VC-WIN32 no-asm --prefix=%TARGET%
call ms\do_ms.bat
nmake -f ms\ntdll.mak clean
nmake -f ms\ntdll.mak
nmake -f ms\ntdll.mak install
cd ..

:: ----------------------------------------------------------------------------
:end
