# frozen_string_literal: true

require 'active_record'

class Order < ActiveRecord::Base
  has_one :order_detail, class_name: 'OrderDetail', primary_key: 'order_id'
  self.table_name = 't_orders'
end
