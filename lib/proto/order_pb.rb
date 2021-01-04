# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: proto/order.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("proto/order.proto", :syntax => :proto3) do
    add_message "leo.Order" do
      optional :id, :string, 1
      optional :productId, :string, 2
      optional :ordererId, :string, 3
      optional :sellerId, :string, 4
      optional :price, :int64, 5
      optional :productName, :string, 6
      optional :createdAt, :int64, 9
    end
    add_message "leo.PostOrderRequest" do
      optional :productId, :string, 1
      optional :ordererId, :string, 2
    end
    add_message "leo.ListOrderByProductIdRequest" do
      optional :productId, :string, 1
    end
    add_message "leo.ListOrderBySellerIdRequest" do
      optional :sellerId, :string, 1
    end
    add_message "leo.ListOrderByOrdererIdRequest" do
      optional :ordererId, :string, 1
    end
    add_message "leo.FindOrderRequest" do
      optional :id, :string, 1
    end
    add_message "leo.DeleteOrderRequest" do
      optional :id, :string, 1
    end
    add_message "leo.PostOrderResponse" do
      optional :order, :message, 1, "leo.Order"
    end
    add_message "leo.ListOrderByProductIdResponse" do
      repeated :orders, :message, 1, "leo.Order"
    end
    add_message "leo.ListOrderBySellerIdResponse" do
      repeated :orders, :message, 1, "leo.Order"
    end
    add_message "leo.ListOrderByOrdererIdResponse" do
      repeated :orders, :message, 1, "leo.Order"
    end
    add_message "leo.FindOrderResponse" do
      optional :order, :message, 1, "leo.Order"
    end
    add_message "leo.DeleteOrderResponse" do
    end
  end
end

module Leo
  Order = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.Order").msgclass
  PostOrderRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.PostOrderRequest").msgclass
  ListOrderByProductIdRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.ListOrderByProductIdRequest").msgclass
  ListOrderBySellerIdRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.ListOrderBySellerIdRequest").msgclass
  ListOrderByOrdererIdRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.ListOrderByOrdererIdRequest").msgclass
  FindOrderRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.FindOrderRequest").msgclass
  DeleteOrderRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.DeleteOrderRequest").msgclass
  PostOrderResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.PostOrderResponse").msgclass
  ListOrderByProductIdResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.ListOrderByProductIdResponse").msgclass
  ListOrderBySellerIdResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.ListOrderBySellerIdResponse").msgclass
  ListOrderByOrdererIdResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.ListOrderByOrdererIdResponse").msgclass
  FindOrderResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.FindOrderResponse").msgclass
  DeleteOrderResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.DeleteOrderResponse").msgclass
end
