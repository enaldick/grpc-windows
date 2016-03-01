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

# -----------------------------------------------------------------------------

set(grpc_source_dir
	${CMAKE_CURRENT_SOURCE_DIR}/grpc/grpc-release-0_13_0
)
include_directories(AFTER
	.
)

include(libgrpc.cmake)
include(libgrpc_unsecure.cmake)

include(libgrpc++.cmake)
include(libgrpc++_unsecure.cmake)

include(libgrpc_plugin_support.cmake)

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

