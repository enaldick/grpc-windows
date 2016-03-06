# Copyright 2016 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set(OPENSSL_ROOT ${PROJECT_SOURCE_DIR}/3rdparty/openssl)

if(WIN32)
	if(CMAKE_SIZEOF_VOID_P EQUAL 8)
		include_directories(AFTER ${OPENSSL_ROOT}/openssl-win64/include)
		link_directories(${OPENSSL_ROOT}/openssl-win64/lib)
		set(OPENSSL_LIB libeay32.lib ssleay32.lib ws2_32.lib)

		install(PROGRAMS
			${OPENSSL_ROOT}/openssl-win64/bin/libeay32.dll
			${OPENSSL_ROOT}/openssl-win64/bin/ssleay32.dll
			DESTINATION ${PROJECT_SOURCE_DIR}/bin
		)
	else()
		include_directories(AFTER ${OPENSSL_ROOT}/openssl-win32/include)
		link_directories(${OPENSSL_ROOT}/openssl-win32/lib)
		set(OPENSSL_LIB libeay32.lib ssleay32.lib ws2_32.lib)

		install(PROGRAMS
			${OPENSSL_ROOT}/openssl-win32/bin/libeay32.dll
			${OPENSSL_ROOT}/openssl-win32/bin/ssleay32.dll
			DESTINATION ${PROJECT_SOURCE_DIR}/bin
		)
	endif()
elseif(APPLE)
	include_directories(AFTER /usr/local/opt/openssl/include)
	link_directories(/usr/local/opt/openssl/lib)
	set(OPENSSL_LIB ssl crypto)
else()
	include_directories(AFTER /usr/local/ssl/include)
	link_directories(/usr/local/ssl/lib)
	set(OPENSSL_LIB ssl crypto)
endif()
