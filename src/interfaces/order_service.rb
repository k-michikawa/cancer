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
    product = @product_grpc.find_product product_id: req.productId
    order_with_detail = OrderUseCase.store_order product_id: req.productId, orderer_id: req.ordererId, product: product

    Leo::PostOrderResponse.new(order: Leo::Order.new(
      id: order_with_detail[:order].id,
      productId: order_with_detail[:order].product_id,
      ordererId: order_with_detail[:order].orderer_id,
      sellerId: order_with_detail[:order].seller_id,
      price: order_with_detail[:detail].price,
      productName: order_with_detail[:detail].product_name,
      createdAt: order_with_detail[:order].created_at.to_i
    ))
  rescue => e
    @err_logger.error(e.message)
    raise GRPC::BadStatus.new_status_exception(INTERNAL)
  end

  def list_order_by_product_id(req, _)
    orders = OrderUseCase.list_by_product_id product_id: req.productId
    Leo::ListOrderByProductIdResponse.new(
      orders: orders.map do |order_with_detail|
        Leo::Order.new(
          id: order_with_detail[:order].id,
          productId: order_with_detail[:order].product_id,
          ordererId: order_with_detail[:order].orderer_id,
          sellerId: order_with_detail[:order].seller_id,
          price: order_with_detail[:detail].price,
          productName: order_with_detail[:detail].product_name,
          createdAt: order_with_detail[:order].created_at.to_i
        )
      end
    )
  rescue => e
    @err_logger.error(e.message)
    raise GRPC::BadStatus.new_status_exception(INTERNAL)
  end

  def list_order_by_seller_id(req, _)
    orders = OrderUseCase.list_by_seller_id seller_id: req.sellerId
    Leo::ListOrderBySellerIdResponse.new(
      orders: orders.map do |order_with_detail|
        Leo::Order.new(
          id: order_with_detail[:order].id,
          productId: order_with_detail[:order].product_id,
          ordererId: order_with_detail[:order].orderer_id,
          sellerId: order_with_detail[:order].seller_id,
          price: order_with_detail[:detail].price,
          productName: order_with_detail[:detail].product_name,
          createdAt: order_with_detail[:order].created_at.to_i
        )
      end
    )
  rescue => e
    @err_logger.error(e.message)
    raise GRPC::BadStatus.new_status_exception(INTERNAL)
  end

  def list_order_by_orderer_id(req, _)
    orders = OrderUseCase.list_by_orderer_id orderer_id: req.ordererId
    Leo::ListOrderByOrdererIdResponse.new(
      orders: orders.map do |order_with_detail|
        Leo::Order.new(
          id: order_with_detail[:order].id,
          productId: order_with_detail[:order].product_id,
          ordererId: order_with_detail[:order].orderer_id,
          sellerId: order_with_detail[:order].seller_id,
          price: order_with_detail[:detail].price,
          productName: order_with_detail[:detail].product_name,
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
    Leo::PostOrderResponse.new(order: Leo::Order.new(
      id: order_with_detail[:order].id,
      productId: order_with_detail[:order].product_id,
      ordererId: order_with_detail[:order].orderer_id,
      sellerId: order_with_detail[:order].seller_id,
      price: order_with_detail[:detail].price,
      productName: order_with_detail[:detail].product_name,
      createdAt: order_with_detail[:order].created_at.to_i
    ))
  rescue => e
    @err_logger.error(e.message)
    raise GRPC::BadStatus.new_status_exception(INTERNAL)
  end

  def delete_order(req, _)
    OrderRepository.delete order_id: req.id
    Leo::DeleteOrderResponse.new
  rescue => e
    @err_logger.error(e.message)
    raise GRPC::BadStatus.new_status_exception(INTERNAL)
  end
end
