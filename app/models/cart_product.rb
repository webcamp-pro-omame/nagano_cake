class CartProduct < ApplicationRecord
  
  belongs_to :customer
  belongs_to :product
  
  #商品の税込価格を出すメソッド
  def add_tax_price
    (self.product.price * 1.10).round
  end
  
  #商品毎の合計金額を出すメソッド
  def sub_price
      add_tax_price * self.amount
  end
  
end
