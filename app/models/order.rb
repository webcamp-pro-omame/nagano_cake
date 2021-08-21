class Order < ApplicationRecord
    
    belongs_to :customer
    has_many :order_products, dependent: :destroy
    
    enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
    #enum address: { ご自身の住所: 0, 選択済み住所から選択: 1 , 新しいお届け先: 2 }
    enum status: { 入金待ち: 0, 入金確認: 1, 制作中: 2, 発送準備中: 3, 発送済み: 4 }
end
