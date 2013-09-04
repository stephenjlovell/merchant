class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :user

  def total
    self.order_items.inject(0.00) { |sum, item| sum + item.product.price }
  end

  def total_items
    self.order_items.inject(0) { |sum, item| sum + item.quantity }
  end

end
