# Copyright 2016 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

project(GRPC)

add_subdirectory(
	./3rdparty/protorpc3-cxx
)
add_subdirectory(
	./3rdparty/zlib
)

include_directories(AFTER
	.
)

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

