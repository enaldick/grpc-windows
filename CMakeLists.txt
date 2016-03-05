# Copyright 2016 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

project(PROJECT_GRPC)

# grpc
add_subdirectory(${CMAKE_SOURCE_DIR}/grpc)

# Protobuf
add_subdirectory(${CMAKE_SOURCE_DIR}/3rdparty/protobuf)

# zlib
add_subdirectory(${CMAKE_SOURCE_DIR}/3rdparty/zlib)

# cc-mini-test
add_subdirectory(${CMAKE_SOURCE_DIR}/3rdparty/cc-mini-test)
