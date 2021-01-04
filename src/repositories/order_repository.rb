# frozen_string_literal: true

require_relative '../models/order_model'
require_relative '../models/order_detail_model'

class OrderRepository
  def self.store_order(product_id:, orderer_id:, product:)
    order = Order.create(product_id: product_id, orderer_id: orderer_id, seller_id: product.sellerId)
    detail = OrderDetail.create(order_id: order.id, price: product.price, product_name: product.name)
    { order: order, detail: detail }
  end

  def self.list_by_product_id(product_id:)
    orders = Order.includes(:t_order_details).where(product_id: product_id, is_deleted: false)
    orders.map do |order|
      { order: order, detail: order.t_order_details }
    end
  end

  def self.list_by_seller_id(seller_id:)
    orders = Order.includes(:t_order_details).where(seller_id: seller_id, is_deleted: false)
    orders.map do |order|
      { order: order, detail: order.t_order_details }
    end
  end

  def self.list_by_orderer_id(orderer_id:)
    orders = Order.includes(:t_order_details).where(orderer_id: orderer_id, is_deleted: false)
    orders.map do |order|
      { order: order, detail: order.t_order_details }
    end
  end

  def self.find(order_id:)
    order = Order.where(is_deleted: false).find_by(id: order_id)
    { order: order, detail: order.t_order_details }
  end

  def self.delete(order_id:)
    Order.where(is_deleted: false).find_by(id: order_id).update(is_deleted: true)
    nil
  end
end
