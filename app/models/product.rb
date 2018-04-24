class Product < ApplicationRecord
  has_many :line_items, inverse_of: :product
  has_many :orders, through: :line_items

  validates :name, :description, :price, presence: true
end
