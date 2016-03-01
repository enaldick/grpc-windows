# Copyright 2013 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

project(ZLIB)

include_directories(AFTER
	.
)

set(ZLIB_HDR
	./zlib.h
	./crc32.h
	./deflate.h
	./gzguts.h
	./inffast.h
	./inffixed.h
	./inflate.h
	./inftrees.h
	./trees.h
	./zutil.h
)

set(ZLIB_SRC
	./adler32.c
	./compress.c
	./crc32.c
	./deflate.c
	./gzclose.c
	./gzlib.c
	./gzread.c
	./gzwrite.c
	./inflate.c
	./infback.c
	./inftrees.c
	./inffast.c
	./trees.c
	./uncompr.c
	./zutil.c
)

add_library(libzlib
	${ZLIB_HDR}
	${ZLIB_SRC}
)
install(TARGETS libzlib
	RUNTIME DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	LIBRARY DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	ARCHIVE DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/lib
)

add_executable(zlib_example
	./test/example.c
)
target_link_libraries(zlib_example
	libzlib
)
