# Copyright 2016 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

project(GRPC)

if(NOT MSVC)
	set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")
endif()

# -----------------------------------------------------------------------------
# 3rdparty

# Protobuf
set(PROTOBUF_ROOT ${CMAKE_SOURCE_DIR}/3rdparty/protobuf)
include_directories(AFTER ${PROTOBUF_ROOT}/protobuf-3.0.0-beta-2/src)

# zlib
set(ZLIB_ROOT ${CMAKE_SOURCE_DIR}/3rdparty/zlib)
include_directories(AFTER ${ZLIB_ROOT})

# cc-mini-test
set(CC_MINI_TEST_ROOT ${CMAKE_SOURCE_DIR}/3rdparty/cc-mini-test)
include_directories(AFTER ${CC_MINI_TEST_ROOT})

# -----------------------------------------------------------------------------
# openssl

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

# -----------------------------------------------------------------------------

if(WIN32)
	add_definitions(-D_WIN32_WINNT=0x0600)
endif()

set(grpc_source_dir
	${CMAKE_CURRENT_SOURCE_DIR}/grpc-release-0_13_0
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
target_link_libraries(libgrpc
	${OPENSSL_LIB}
	libprotobuf
	libzlib
)
install(TARGETS libgrpc
	RUNTIME DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	LIBRARY DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	ARCHIVE DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/lib
)

add_library(libgrpc_unsecure
	${libgrpc_unsecure_source_files}
	${libgrpc_unsecure_header_files}

	${libgrpc_unsecure_cpp_source_files}
	${libgrpc_unsecure_cpp_header_files}
)
target_link_libraries(libgrpc_unsecure
	${OPENSSL_LIB}
	libprotobuf
	libzlib
)
install(TARGETS libgrpc_unsecure
	RUNTIME DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	LIBRARY DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	ARCHIVE DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/lib
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
install(TARGETS grpc_cpp_plugin
	RUNTIME DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	LIBRARY DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	ARCHIVE DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/lib
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
	libgrpc
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
	libgrpc
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
)
install(TARGETS grpc-hello
	RUNTIME DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	LIBRARY DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin
	ARCHIVE DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/lib
)

# -----------------------------------------------------------------------------
