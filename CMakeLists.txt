# Copyright 2016 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

project(GRPC)

# -----------------------------------------------------------------------------

add_subdirectory(
	${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/protorpc3-cxx
)
add_subdirectory(
	${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/zlib
)

include_directories(AFTER
	${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/protorpc3-cxx/protobuf/protobuf-3.0.0-beta-2/src
	${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/zlib
)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
	include_directories(AFTER
		${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/openssl/openssl-win64/include
	)
	link_directories(
		${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/openssl/openssl-win64/lib
	)
else()
	include_directories(AFTER
		${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/openssl/openssl-win32/include
	)
	link_directories(
		${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/openssl/openssl-win32/lib
	)
endif()

if(WIN32)
	set(OPENSSL_LIB
		libeay32.lib
		ssleay32.lib
		ws2_32.lib
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

	${libgrpc_cpp_source_files}
	${libgrpc_cpp_header_files}
)
add_library(libgrpc_unsecure
	${libgrpc_unsecure_source_files}
	${libgrpc_unsecure_header_files}

	${libgrpc_unsecure_cpp_source_files}
	${libgrpc_unsecure_cpp_header_files}
)

add_executable(grpc_cpp_plugin
	${grpc_source_dir}/src/compiler/cpp_plugin.cc

	${libgrpc_plugin_support_source_files}
	${libgrpc_plugin_support_header_files}
)
target_link_libraries(grpc_cpp_plugin
	libprotoc
	libzlib
)

# -----------------------------------------------------------------------------

add_executable(greeter_server
	./examples/helloworld/greeter_server.cc

	./examples/helloworld/helloworld.pb.h
	./examples/helloworld/helloworld.pb.cc
	./examples/helloworld/helloworld.grpc.pb.h
	./examples/helloworld/helloworld.grpc.pb.cc
)
target_link_libraries(greeter_server
	${OPENSSL_LIB}
	libgrpc
	libprotorpc
	libzlib
)
install(TARGETS greeter_server
	RUNTIME DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	LIBRARY DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	ARCHIVE DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/lib
)

add_executable(greeter_client
	./examples/helloworld/greeter_client.cc

	./examples/helloworld/helloworld.pb.h
	./examples/helloworld/helloworld.pb.cc
	./examples/helloworld/helloworld.grpc.pb.h
	./examples/helloworld/helloworld.grpc.pb.cc
)
target_link_libraries(greeter_client
	${OPENSSL_LIB}
	libgrpc
	libprotorpc
	libzlib
)
install(TARGETS greeter_client
	RUNTIME DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	LIBRARY DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	ARCHIVE DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/lib
)

# -----------------------------------------------------------------------------

add_executable(grpc-hello
	./hello.cc
)
target_link_libraries(grpc-hello
	libgrpc
	libprotorpc
	libzlib
)
install(TARGETS grpc-hello
	RUNTIME DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	LIBRARY DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	ARCHIVE DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/lib
)

# -----------------------------------------------------------------------------

