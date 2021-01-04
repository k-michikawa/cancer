# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: proto/user.proto for package 'leo'

require 'grpc'
require 'proto/user_pb'

module Leo
  module UserService
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'leo.UserService'

      rpc :PostUser, ::Leo::PostUserRequest, ::Leo::PostUserResponse
      rpc :ListUser, ::Leo::ListUserRequest, ::Leo::ListUserResponse
      rpc :FindUser, ::Leo::FindUserRequest, ::Leo::FindUserResponse
      rpc :UpdateUser, ::Leo::UpdateUserRequest, ::Leo::UpdateUserResponse
      rpc :DeleteUser, ::Leo::DeleteUserRequest, ::Leo::DeleteUserResponse
    end

    Stub = Service.rpc_stub_class
  end
end