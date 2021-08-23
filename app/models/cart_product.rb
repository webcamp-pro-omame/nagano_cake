class CartProduct < ApplicationRecord
  
  belongs_to :customer
  belongs_to :product
  
  def add_tax_price
    (self.product.price * 1.10).round
  end
  
  def sub_price
      add_tax_price * self.amount
  end
  
  def total_price
      @sum = 0
      self.products.each do |product|
        @sum += product.sub_price
      end
      return @sum
  end
  
end
