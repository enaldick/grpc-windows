# Copyright 2016 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

project(GRPC)

# -----------------------------------------------------------------------------

add_subdirectory(
	./3rdparty/protorpc3-cxx
)
add_subdirectory(
	./3rdparty/zlib
)


if(CMAKE_SIZEOF_VOID_P EQUAL 8)
	include_directories(AFTER
		./3rdparty/openssl/openssl-win64/include
	)
else()
	include_directories(AFTER
		./3rdparty/openssl/openssl-win32/include
	)
endif()

if(MSVC)
	include_directories(AFTER
		./msvc
	)
endif()

# -----------------------------------------------------------------------------

if(WIN32)
	add_definitions(-D_WIN32_WINNT=0x0600)
endif()

set(grpc_source_dir
	${CMAKE_CURRENT_SOURCE_DIR}/grpc/grpc-release-0_13_0
)
include_directories(AFTER
	${grpc_source_dir}/include
	${grpc_source_dir}
)

include(libgrpc.cmake)
include(libgrpc_unsecure.cmake)

include(libgrpc++.cmake)
include(libgrpc++_unsecure.cmake)

include(libgrpc_plugin_support.cmake)

add_library(libgrpc
	${libgrpc_source_files}
	${libgrpc_header_files}
)

# -----------------------------------------------------------------------------

add_executable(grpc-hello
	./hello.cc
)
target_link_libraries(grpc-hello
	libprotoc
)
install(TARGETS grpc-hello
	RUNTIME DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	LIBRARY DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	ARCHIVE DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/lib
)

# -----------------------------------------------------------------------------

