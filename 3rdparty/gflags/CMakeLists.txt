# Copyright 2013 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

project(GFLAGS)

include_directories(AFTER
	./src
)

set(GFLAGS_SRC
	./src/gflags.cc
	./src/gflags_reporting.cc
	./src/gflags_completions.cc
)

if(WIN32)
	set(GFLAGS_SRC ${GFLAGS_SRC}
		./src/windows_port.cc
	)
endif()

add_library(libgflags
	${GFLAGS_SRC}
)
install(TARGETS libgflags
	RUNTIME DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	LIBRARY DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	ARCHIVE DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/lib
)
