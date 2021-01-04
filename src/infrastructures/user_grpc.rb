# frozen_string_literal: true

require 'grpc'
require 'proto/user_services_pb'

# UserGrpc is send gRPC request to user service
class UserGrpc
  def initialize(hostname:)
    @stub = Leo::UserService::Stub.new(hostname, :this_channel_is_insecure)
  end

  def find_user(user_id:)
    request = Leo::FindUserRequest.new(id: user_id)
    # 例外が発生する可能性があるが、呼び出し側でrescueしたいので特に気にしない
    @stub.find_user(request).message
  end
end
