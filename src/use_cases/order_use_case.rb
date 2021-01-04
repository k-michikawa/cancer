# frozen_string_literal: true

require_relative '../repositories/order_repository'

class OrderUseCase
  def self.store(product_id:, orderer_id:, product:)
    OrderRepository.store(product_id: product_id, orderer_id: orderer_id, product: product)
  end

  def self.list_by_product_id(product_id:)
    OrderRepository.list_by_product_id(product_id: product_id)
  end

  def self.list_by_seller_id(seller_id:)
    OrderRepository.list_by_seller_id(seller_id: seller_id)
  end

  def self.list_by_orderer_id(orderer_id:)
    OrderRepository.list_by_orderer_id(orderer_id: orderer_id)
  end

  def self.find(order_id:)
    OrderRepository.find(order_id: order_id)
  end

  def self.delete(order_id:)
    OrderRepository.delete(order_id: order_id)
  end
end
