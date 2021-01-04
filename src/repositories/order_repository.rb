# frozen_string_literal: true

require_relative '../models/order_model'
require_relative '../models/order_detail_model'

class OrderRepository
  def self.store_order(product_id:, orderer_id:, product:)
    order = Order.create(product_id: product_id, orderer_id: orderer_id, seller_id: product.seller_id)
    detail = OrderDetail.create(order_id: order.id, price: product.price, product_name: product.name)
    { order: order, detail: detail }
  end

  def self.list_by_product_id(product_id:)
    orders = Order.includes(:order_details).where(product_id: product_id)
    orders.map do |order|
      { order: order, detail: order.order_detail }
    end
  end

  def self.list_by_orderer_id(orderer_id:)
    orders = Order.includes(:order_details).where(orderer_id: orderer_id)
    orders.map do |order|
      { order: order, detail: order.order_detail }
    end
  end

  def self.find(order_id:)
    order = Order.find_by(id: order_id)
    { order: order, detail: order.order_detail }
  end

  def self.delete(order_id:)
    order = find(order_id: order_id)
    order.update(is_deleted: true)
  end
end
