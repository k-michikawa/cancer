#!/usr/bin/env ruby
# frozen_string_literal: true

lib = File.join(__dir__, 'lib')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'grpc'
require 'proto/user_services_pb'

class UserService < Leo::UserService::Service
  def initialize
    super()
    @sample_user = Leo::User.new(
      id: 'b3ef5930-f849-443a-a415-21a095088568',
      name: 'ユーザー1',
      email: 'sample-user@test.co.jp',
      createdAt: 1_609_724_593
    )
  end

  def post_user(_req, _)
    Leo::PostOrderResponse.new(user: @sample_user)
  end

  def list_user(_req, _)
    Leo::ListUserResponse.new(users: [@sample_user])
  end

  def find_user(_req, _)
    Leo::FindUserResponse.new(user: @sample_user)
  end

  def update_user(_req, _)
    Leo::UpdateUserResponse.new(user: @sample_user)
  end

  def delete_user(_req, _)
    Leo::DeleteUserResponse.new
  end
end

server = GRPC::RpcServer.new
server.add_http2_port("0.0.0.0:#{ENV.fetch('LISTEN_PORT')}", :this_port_is_insecure)
server.handle(UserService.new)
server.run_till_terminated_or_interrupted(%w[SIGHUP SIGINT SIGQUIT])
