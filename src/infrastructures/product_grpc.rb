# frozen_string_literal: true

require 'grpc'
require 'proto/product_services_pb'

# ProductGrpc is send gRPC request to product service
class ProductGrpc
  def initialize(hostname:)
    @stub = Leo::ProductService::Stub.new(hostname, :this_channel_is_insecure)
  end

  def find_product(product_id:)
    request = Leo::FindProductRequest.new(id: product_id)
    # 例外が発生する可能性があるが、呼び出し側でrescueしたいので特に気にしない
    @stub.find_product(request).product
  end
end
