#!/usr/bin/env ruby
# frozen_string_literal: true

lib = File.join(__dir__, 'lib')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'active_record'
require 'rpc_server'
require_relative 'interfaces/order_service'
require_relative 'infrastructures/product_grpc'
require_relative 'infrastructures/user_grpc'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: ENV.fetch('DATABASE_HOST'),
  username: ENV.fetch('DATABASE_USER'),
  password: ENV.fetch('DATABASE_PASSWORD'),
  database: ENV.fetch('DATABASE_NAME'),
  port: ENV.fetch('DATABASE_PORT'),
  pool: 10
)

host = "0.0.0.0:#{ENV.fetch('LISTEN_PORT')}"
server = RpcServer.new(host: host)
server.handle(
  OrderService.new(
    product_grpc: ProductGrpc.new(hostname: ENV.fetch('ARIES_URL')),
    user_grpc: UserGrpc.new(hostname: ENV.fetch('TAURUS_URL'))
  )
)
server.run
