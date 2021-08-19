class Order < ApplicationRecord

    belongs_to :customer
    has_many :order_products, dependent: :destroy
    
    enum status: {
        waiting: 0,
        paid_up: 1,
        making: 2,
        preparing: 3,
        shipped: 4
    }
end
