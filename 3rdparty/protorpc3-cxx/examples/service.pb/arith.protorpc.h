// Generated by the protorpc compiler.  DO NOT EDIT!!!
// source: arith.proto

#pragma once

#ifndef PROTORPC_arith_2eproto__INCLUDED
#define PROTORPC_arith_2eproto__INCLUDED

#include "arith.pb.h"

#include <protorpc/rpc_server.h>
#include <protorpc/rpc_client.h>

namespace service {

class ArithService_Stub;

class ArithService: public ::protorpc::Service {
protected:
	// This class should be treated as an abstract interface.
	inline ArithService() {}
public:
	virtual ~ArithService();

	typedef ArithService_Stub Stub;

	static const ::google::protobuf::ServiceDescriptor* descriptor();

	virtual const ::protorpc::Error add(
		const ::service::ArithRequest* request,
		::service::ArithResponse* response
	);
	virtual const ::protorpc::Error mul(
		const ::service::ArithRequest* request,
		::service::ArithResponse* response
	);
	virtual const ::protorpc::Error div(
		const ::service::ArithRequest* request,
		::service::ArithResponse* response
	);
	virtual const ::protorpc::Error error(
		const ::service::ArithRequest* request,
		::service::ArithResponse* response
	);

	// implements Service ----------------------------------------------

	const ::google::protobuf::ServiceDescriptor* GetDescriptor();
	const ::protorpc::Error CallMethod(
		const ::google::protobuf::MethodDescriptor* method,
		const ::google::protobuf::Message* request,
		::google::protobuf::Message* response
	);
	const ::google::protobuf::Message& GetRequestPrototype(
		const ::google::protobuf::MethodDescriptor* method
	) const;
	const ::google::protobuf::Message& GetResponsePrototype(
		const ::google::protobuf::MethodDescriptor* method
	) const;

private:
	GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(ArithService);
}; // ArithService

class ArithService_Stub : public ArithService {
public:
	ArithService_Stub(::protorpc::Caller* client);
	ArithService_Stub(::protorpc::Caller* client, bool client_ownership);
	~ArithService_Stub();

	// implements ArithService ------------------------------------------

	const ::protorpc::Error add(
		const ::service::ArithRequest* request,
		::service::ArithResponse* response
	);
	const ::protorpc::Error mul(
		const ::service::ArithRequest* request,
		::service::ArithResponse* response
	);
	const ::protorpc::Error div(
		const ::service::ArithRequest* request,
		::service::ArithResponse* response
	);
	const ::protorpc::Error error(
		const ::service::ArithRequest* request,
		::service::ArithResponse* response
	);

private:
	::protorpc::Caller* client_;
	bool owns_client_;
	GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(ArithService_Stub);
}; // ArithService_Stub

} // namespace service

#endif // PROTORPC_arith_2eproto__INCLUDED