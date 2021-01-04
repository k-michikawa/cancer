# frozen_string_literal: true

require 'logger'
require 'grpc'
require 'proto/order_services_pb'
require_relative '../use_cases/order_use_case'

class OrderService < Leo::OrderService::Service
  def initialize(product_grpc:, user_grpc:)
    super()
    @product_grpc = product_grpc
    @user_grpc = user_grpc
    @err_logger = Logger.new($stdout)
  end

  def post_order(req, _)
    product = @product_grpc.find_product product_id: req.product_id
    order_with_detail = OrderUseCase.store_order product_id: req.product_id, orderer_id: req.orderer_id, product: product

    Leo::PostOrderResponse.new(order: Cancer::Order.new(
      id: order_with_detail[:order].id,
      productId: order_with_detail[:order].product_id,
      ordererId: order_with_detail[:order].orderer_id,
      sellerId: order_with_detail[:order].seller_id,
      price: order_with_detail[:detail].price,
      productName: order_with_detail[:detail].name,
      createdAt: order_with_detail[:order].created_at.to_i
    ))
  rescue => e
    @err_logger.error(e.message)
    raise GRPC::BadStatus.new_status_exception(INTERNAL)
  end

  def list_order_by_product_id(req, _)
    orders = OrderUseCase.list_by_product_id product_id: req.product_id
    Leo::ListOrderByProductIdRequest.new(
      orders: orders.map do |order_with_detail|
        Cancer::Order.new(
          id: order_with_detail[:order].id,
          productId: order_with_detail[:order].product_id,
          ordererId: order_with_detail[:order].orderer_id,
          sellerId: order_with_detail[:order].seller_id,
          price: order_with_detail[:detail].price,
          productName: order_with_detail[:detail].name,
          createdAt: order_with_detail[:order].created_at.to_i
        )
      end
    )
  rescue => e
    @err_logger.error(e.message)
    raise GRPC::BadStatus.new_status_exception(INTERNAL)
  end

  def list_order_by_orderer_id(req, _)
    orders = OrderUseCase.list_by_orderer_id orderer_id: req.orderer_id
    Leo::ListOrderByOrdererIdResponse.new(
      orders: orders.map do |order_with_detail|
        Cancer::Order.new(
          id: order_with_detail[:order].id,
          productId: order_with_detail[:order].product_id,
          ordererId: order_with_detail[:order].orderer_id,
          sellerId: order_with_detail[:order].seller_id,
          price: order_with_detail[:detail].price,
          productName: order_with_detail[:detail].name,
          createdAt: order_with_detail[:order].created_at.to_i
        )
      end
    )
  rescue => e
    @err_logger.error(e.message)
    raise GRPC::BadStatus.new_status_exception(INTERNAL)
  end

  def find_order(req, _)
    order_with_detail = OrderUseCase.find order_id: req.id
    Leo::PostOrderResponse.new(order: Cancer::Order.new(
      id: order_with_detail[:order].id,
      productId: order_with_detail[:order].product_id,
      ordererId: order_with_detail[:order].orderer_id,
      sellerId: order_with_detail[:order].seller_id,
      price: order_with_detail[:detail].price,
      productName: order_with_detail[:detail].name,
      createdAt: order_with_detail[:order].created_at.to_i
    ))
  rescue => e
    @err_logger.error(e.message)
    raise GRPC::BadStatus.new_status_exception(INTERNAL)
  end

  def delete_order(req, _)
    OrderRepository.delete order_id: req.order_id
  rescue => e
    @err_logger.error(e.message)
    raise GRPC::BadStatus.new_status_exception(INTERNAL)
  end
end
