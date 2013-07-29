class Product < ActiveRecord::Base

  def price=(input)
    input.to_s.delete!("$")
    super
  end

  validates_numericality_of :price

end
