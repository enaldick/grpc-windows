# Copyright 2013 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

#project(ZLIB)

#------------------------------------------------------------------------------
# zlib

set(ZLIB_ROOT
	${CMAKE_CURRENT_SOURCE_DIR}/../third_party/zlib
)

include_directories(AFTER
	${ZLIB_ROOT}
)

set(ZLIB_HDR
	${ZLIB_ROOT}/zlib.h
	${ZLIB_ROOT}/crc32.h
	${ZLIB_ROOT}/deflate.h
	${ZLIB_ROOT}/gzguts.h
	${ZLIB_ROOT}/inffast.h
	${ZLIB_ROOT}/inffixed.h
	${ZLIB_ROOT}/inflate.h
	${ZLIB_ROOT}/inftrees.h
	${ZLIB_ROOT}/trees.h
	${ZLIB_ROOT}/zutil.h
)

set(ZLIB_SRC
	${ZLIB_ROOT}/adler32.c
	${ZLIB_ROOT}/compress.c
	${ZLIB_ROOT}/crc32.c
	${ZLIB_ROOT}/deflate.c
	${ZLIB_ROOT}/gzclose.c
	${ZLIB_ROOT}/gzlib.c
	${ZLIB_ROOT}/gzread.c
	${ZLIB_ROOT}/gzwrite.c
	${ZLIB_ROOT}/inflate.c
	${ZLIB_ROOT}/infback.c
	${ZLIB_ROOT}/inftrees.c
	${ZLIB_ROOT}/inffast.c
	${ZLIB_ROOT}/trees.c
	${ZLIB_ROOT}/uncompr.c
	${ZLIB_ROOT}/zutil.c
)

#add_executable(zlib_example
#	${ZLIB_ROOT}/test/example.c
#
#	${ZLIB_HDR}
#	${ZLIB_SRC}
#)

