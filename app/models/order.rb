class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy

  def total
    self.order_items.inject(0.00) { |sum, item| sum + item.product.price }
  end
end
