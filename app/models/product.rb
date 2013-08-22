class Product < ActiveRecord::Base

  def price=(input)
    input.to_s.delete!("$")
    super
  end

  validates_numericality_of :price
  validates_numericality_of :stock, only_integer: true, greater_than: 0

end
