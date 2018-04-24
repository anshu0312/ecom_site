class Order < ApplicationRecord
  belongs_to :user

  has_many :line_items, inverse_of: :order
  has_many :products, through: :line_items

  before_create :set_total

  accepts_nested_attributes_for :line_items, reject_if: :all_blank, allow_destroy: true

  private

  def set_total
    self.total = line_items.collect { |li| li.valid? ? (li.product_quantity * li.product_price) : 0 }.sum
  end
end
