# Copyright 2016 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

# copy from ${grpc_source_dir}/BUILD

set(libgrpc_cpp_source_files
	${grpc_source_dir}/src/cpp/client/secure_credentials.h
	${grpc_source_dir}/src/cpp/common/secure_auth_context.h
	${grpc_source_dir}/src/cpp/server/secure_server_credentials.h
	${grpc_source_dir}/src/cpp/client/create_channel_internal.h
	${grpc_source_dir}/src/cpp/common/create_auth_context.h
	${grpc_source_dir}/src/cpp/server/dynamic_thread_pool.h
	${grpc_source_dir}/src/cpp/server/fixed_size_thread_pool.h
	${grpc_source_dir}/src/cpp/server/thread_pool_interface.h
	${grpc_source_dir}/src/cpp/client/secure_credentials.cc
	${grpc_source_dir}/src/cpp/common/auth_property_iterator.cc
	${grpc_source_dir}/src/cpp/common/secure_auth_context.cc
	${grpc_source_dir}/src/cpp/common/secure_channel_arguments.cc
	${grpc_source_dir}/src/cpp/common/secure_create_auth_context.cc
	${grpc_source_dir}/src/cpp/server/secure_server_credentials.cc
	${grpc_source_dir}/src/cpp/client/channel.cc
	${grpc_source_dir}/src/cpp/client/client_context.cc
	${grpc_source_dir}/src/cpp/client/create_channel.cc
	${grpc_source_dir}/src/cpp/client/create_channel_internal.cc
	${grpc_source_dir}/src/cpp/client/credentials.cc
	${grpc_source_dir}/src/cpp/client/generic_stub.cc
	${grpc_source_dir}/src/cpp/client/insecure_credentials.cc
	${grpc_source_dir}/src/cpp/common/call.cc
	${grpc_source_dir}/src/cpp/common/channel_arguments.cc
	${grpc_source_dir}/src/cpp/common/completion_queue.cc
	${grpc_source_dir}/src/cpp/common/rpc_method.cc
	${grpc_source_dir}/src/cpp/proto/proto_utils.cc
	${grpc_source_dir}/src/cpp/server/async_generic_service.cc
	${grpc_source_dir}/src/cpp/server/create_default_thread_pool.cc
	${grpc_source_dir}/src/cpp/server/dynamic_thread_pool.cc
	${grpc_source_dir}/src/cpp/server/fixed_size_thread_pool.cc
	${grpc_source_dir}/src/cpp/server/insecure_server_credentials.cc
	${grpc_source_dir}/src/cpp/server/server.cc
	${grpc_source_dir}/src/cpp/server/server_builder.cc
	${grpc_source_dir}/src/cpp/server/server_context.cc
	${grpc_source_dir}/src/cpp/server/server_credentials.cc
	${grpc_source_dir}/src/cpp/util/byte_buffer.cc
	${grpc_source_dir}/src/cpp/util/slice.cc
	${grpc_source_dir}/src/cpp/util/status.cc
	${grpc_source_dir}/src/cpp/util/string_ref.cc
	${grpc_source_dir}/src/cpp/util/time.cc
	${grpc_source_dir}/src/cpp/codegen/grpc_library.cc
)

set(libgrpc_cpp_header_files
	${grpc_source_dir}/include/grpc++/channel.h
	${grpc_source_dir}/include/grpc++/client_context.h
	${grpc_source_dir}/include/grpc++/completion_queue.h
	${grpc_source_dir}/include/grpc++/create_channel.h
	${grpc_source_dir}/include/grpc++/generic/async_generic_service.h
	${grpc_source_dir}/include/grpc++/generic/generic_stub.h
	${grpc_source_dir}/include/grpc++/grpc++.h
	${grpc_source_dir}/include/grpc++/impl/call.h
	${grpc_source_dir}/include/grpc++/impl/client_unary_call.h
	${grpc_source_dir}/include/grpc++/impl/grpc_library.h
	${grpc_source_dir}/include/grpc++/impl/method_handler_impl.h
	${grpc_source_dir}/include/grpc++/impl/proto_utils.h
	${grpc_source_dir}/include/grpc++/impl/rpc_method.h
	${grpc_source_dir}/include/grpc++/impl/rpc_service_method.h
	${grpc_source_dir}/include/grpc++/impl/serialization_traits.h
	${grpc_source_dir}/include/grpc++/impl/server_builder_option.h
	${grpc_source_dir}/include/grpc++/impl/service_type.h
	${grpc_source_dir}/include/grpc++/impl/sync.h
	${grpc_source_dir}/include/grpc++/impl/sync_cxx11.h
	${grpc_source_dir}/include/grpc++/impl/sync_no_cxx11.h
	${grpc_source_dir}/include/grpc++/impl/thd.h
	${grpc_source_dir}/include/grpc++/impl/thd_cxx11.h
	${grpc_source_dir}/include/grpc++/impl/thd_no_cxx11.h
	${grpc_source_dir}/include/grpc++/security/auth_context.h
	${grpc_source_dir}/include/grpc++/security/auth_metadata_processor.h
	${grpc_source_dir}/include/grpc++/security/credentials.h
	${grpc_source_dir}/include/grpc++/security/server_credentials.h
	${grpc_source_dir}/include/grpc++/server.h
	${grpc_source_dir}/include/grpc++/server_builder.h
	${grpc_source_dir}/include/grpc++/server_context.h
	${grpc_source_dir}/include/grpc++/support/async_stream.h
	${grpc_source_dir}/include/grpc++/support/async_unary_call.h
	${grpc_source_dir}/include/grpc++/support/byte_buffer.h
	${grpc_source_dir}/include/grpc++/support/channel_arguments.h
	${grpc_source_dir}/include/grpc++/support/config.h
	${grpc_source_dir}/include/grpc++/support/config_protobuf.h
	${grpc_source_dir}/include/grpc++/support/slice.h
	${grpc_source_dir}/include/grpc++/support/status.h
	${grpc_source_dir}/include/grpc++/support/status_code_enum.h
	${grpc_source_dir}/include/grpc++/support/string_ref.h
	${grpc_source_dir}/include/grpc++/support/stub_options.h
	${grpc_source_dir}/include/grpc++/support/sync_stream.h
	${grpc_source_dir}/include/grpc++/support/time.h
	${grpc_source_dir}/include/grpc++/impl/codegen/async_stream.h
	${grpc_source_dir}/include/grpc++/impl/codegen/async_unary_call.h
	${grpc_source_dir}/include/grpc++/impl/codegen/call.h
	${grpc_source_dir}/include/grpc++/impl/codegen/call_hook.h
	${grpc_source_dir}/include/grpc++/impl/codegen/channel_interface.h
	${grpc_source_dir}/include/grpc++/impl/codegen/client_context.h
	${grpc_source_dir}/include/grpc++/impl/codegen/client_unary_call.h
	${grpc_source_dir}/include/grpc++/impl/codegen/completion_queue.h
	${grpc_source_dir}/include/grpc++/impl/codegen/completion_queue_tag.h
	${grpc_source_dir}/include/grpc++/impl/codegen/config.h
	${grpc_source_dir}/include/grpc++/impl/codegen/config_protobuf.h
	${grpc_source_dir}/include/grpc++/impl/codegen/grpc_library.h
	${grpc_source_dir}/include/grpc++/impl/codegen/method_handler_impl.h
	${grpc_source_dir}/include/grpc++/impl/codegen/proto_utils.h
	${grpc_source_dir}/include/grpc++/impl/codegen/rpc_method.h
	${grpc_source_dir}/include/grpc++/impl/codegen/rpc_service_method.h
	${grpc_source_dir}/include/grpc++/impl/codegen/security/auth_context.h
	${grpc_source_dir}/include/grpc++/impl/codegen/serialization_traits.h
	${grpc_source_dir}/include/grpc++/impl/codegen/server_context.h
	${grpc_source_dir}/include/grpc++/impl/codegen/server_interface.h
	${grpc_source_dir}/include/grpc++/impl/codegen/service_type.h
	${grpc_source_dir}/include/grpc++/impl/codegen/status.h
	${grpc_source_dir}/include/grpc++/impl/codegen/status_code_enum.h
	${grpc_source_dir}/include/grpc++/impl/codegen/string_ref.h
	${grpc_source_dir}/include/grpc++/impl/codegen/stub_options.h
	${grpc_source_dir}/include/grpc++/impl/codegen/sync.h
	${grpc_source_dir}/include/grpc++/impl/codegen/sync_cxx11.h
	${grpc_source_dir}/include/grpc++/impl/codegen/sync_no_cxx11.h
	${grpc_source_dir}/include/grpc++/impl/codegen/sync_stream.h
	${grpc_source_dir}/include/grpc++/impl/codegen/time.h
)
