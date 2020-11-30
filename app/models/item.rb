class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_fee_burden
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_condition_id
      validates :delivery_fee_burden_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /[0-9]/ }
  end
end
