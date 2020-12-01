class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number
end