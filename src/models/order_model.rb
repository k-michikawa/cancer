# frozen_string_literal: true

require 'active_record'

class Order < ActiveRecord::Base
  has_one :t_order_details, class_name: 'OrderDetail', primary_key: 'id'
  self.table_name = 't_orders'
end
