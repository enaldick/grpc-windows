# Copyright 2016 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

default:
	protoc --cpp_out=. helloworld.proto
	protoc --grpc_out=. --plugin=protoc-gen-grpc=../../bin/grpc_cpp_plugin.exe helloworld.proto
