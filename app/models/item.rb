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
    validates :category_id,              numericality: { other_than: 1 }
    validates :item_condition_id,        numericality: { other_than: 1 }
    validates :delivery_fee_burden_id,   numericality: { other_than: 1 }
    validates :prefecture_id,            numericality: { other_than: 1 }
    validates :days_to_ship_id,          numericality: { other_than: 1 }
    validates :price,                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /[0-9]/ }
  end
end
