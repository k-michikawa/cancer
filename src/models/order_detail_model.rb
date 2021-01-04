# frozen_string_literal: true

require 'active_record'

class OrderDetail < ActiveRecord::Base
  belongs_to :orders, class_name: 'Order', foreign_key: 'order_id'
  self.table_name = 't_order_details'
end
