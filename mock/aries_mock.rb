#!/usr/bin/env ruby
# frozen_string_literal: true

lib = File.join(__dir__, 'lib')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'grpc'
require 'proto/product_services_pb'

class ProductService < Leo::ProductService::Service
  def initialize
    super()
    @sample_product = Leo::Product.new(
      id: '4a7ef360-d798-4aa3-ac6e-7a6a95414c2c',
      name: '商品1',
      price: 1000,
      sellerId: '22482556-8312-4c71-a5d0-9fd2987b038e',
      createdAt: 1_609_724_593
    )
  end

  def post_product(_req, _)
    Leo::PostOrderResponse.new(product: @sample_product)
  end

  def list_product(_req, _)
    Leo::ListProductResponse.new(products: [@sample_product])
  end

  def list_product_by_seller_id(_req, _)
    Leo::ListProductResponse.new(products: [@sample_product])
  end

  def find_product(_req, _)
    Leo::FindProductResponse.new(product: @sample_product)
  end

  def update_product(_req, _)
    Leo::UpdateProductResponse.new(product: @sample_product)
  end

  def delete_product(_req, _)
    Leo::DeleteProductResponse.new
  end
end

server = GRPC::RpcServer.new
server.add_http2_port("0.0.0.0:#{ENV.fetch('LISTEN_PORT')}", :this_port_is_insecure)
server.handle(ProductService.new)
server.run_till_terminated_or_interrupted(%w[SIGHUP SIGINT SIGQUIT])
