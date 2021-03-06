# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: proto/product.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("proto/product.proto", :syntax => :proto3) do
    add_message "leo.Product" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :price, :int64, 3
      optional :sellerId, :string, 4
      optional :createdAt, :int64, 5
      oneof :updatedAtOneof do
        optional :updatedAt, :int64, 6
      end
    end
    add_message "leo.PostProductRequest" do
      optional :name, :string, 1
      optional :price, :int64, 2
      optional :sellerId, :string, 3
    end
    add_message "leo.ListProductRequest" do
    end
    add_message "leo.ListProductBySellerIdRequest" do
      optional :sellerId, :string, 1
    end
    add_message "leo.FindProductRequest" do
      optional :id, :string, 1
    end
    add_message "leo.UpdateProductRequest" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :price, :int64, 3
    end
    add_message "leo.DeleteProductRequest" do
      optional :id, :string, 1
    end
    add_message "leo.PostProductResponse" do
      optional :product, :message, 1, "leo.Product"
    end
    add_message "leo.ListProductResponse" do
      repeated :products, :message, 1, "leo.Product"
    end
    add_message "leo.ListProductBySellerIdResponse" do
      repeated :products, :message, 1, "leo.Product"
    end
    add_message "leo.FindProductResponse" do
      optional :product, :message, 1, "leo.Product"
    end
    add_message "leo.UpdateProductResponse" do
      optional :product, :message, 1, "leo.Product"
    end
    add_message "leo.DeleteProductResponse" do
    end
  end
end

module Leo
  Product = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.Product").msgclass
  PostProductRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.PostProductRequest").msgclass
  ListProductRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.ListProductRequest").msgclass
  ListProductBySellerIdRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.ListProductBySellerIdRequest").msgclass
  FindProductRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.FindProductRequest").msgclass
  UpdateProductRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.UpdateProductRequest").msgclass
  DeleteProductRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.DeleteProductRequest").msgclass
  PostProductResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.PostProductResponse").msgclass
  ListProductResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.ListProductResponse").msgclass
  ListProductBySellerIdResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.ListProductBySellerIdResponse").msgclass
  FindProductResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.FindProductResponse").msgclass
  UpdateProductResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.UpdateProductResponse").msgclass
  DeleteProductResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("leo.DeleteProductResponse").msgclass
end
