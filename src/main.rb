#!/usr/bin/env ruby

lib_dir = File.join(__dir__, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'proto/order_services_pb'

class OrderService < Cancer::OrderService::Service
  def post_order(_req, _unused_call)
    order = Cancer::Order.new(id: '0', productId: '0', ordererId: '0', sellerId: '0', price: 0, productName: 'hoge', ordererName: 'hoge', sellerName: 'hoge', createdAt: 0)
    Cancer::PostOrderResponse.new(order: order)
  end

  def list_order_by_seller_id(_req, _unused_call)
    Cancer::ListOrderBySellerIdResponse.new(orders: [])
  end

  def list_order_by_orderer_id(_req, _unused_call)
    Cancer::ListOrderByOrdererIdResponse.new(orders: [])
  end

  def find_order(_req, _unused_call)
    order = Cancer::Order.new(
      id: '0',
      productId: '0',
      ordererId: '0',
      sellerId: '0',
      price: 0,
      productName: 'hoge',
      ordererName: 'hoge',
      sellerName: 'hoge',
      createdAt: 0
    )
    Cancer::FindOrderResponse.new(order: order)
  end

  def delete_order(_req, _unused_call)
    order = Cancer::Order.new(
      id: '0',
      productId: '0',
      ordererId: '0',
      sellerId: '0',
      price: 0,
      productName: 'hoge',
      ordererName: 'hoge',
      sellerName: 'hoge',
      createdAt: 0
    )
    Cancer::FindOrderResponse.new(order: order)
  end
end

def main
  server = GRPC::RpcServer.new
  server.add_http2_port('0.0.0.0:9030', :this_port_is_insecure)
  server.handle(OrderService)
  server.run_till_terminated_or_interrupted(%w[SIGHUP SIGINT SIGQUIT])
end

main
