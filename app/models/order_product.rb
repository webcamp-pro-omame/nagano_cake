class OrderProduct < ApplicationRecord
    belongs_to :order
    belongs_to :product
    
    enum status: {
        cannot_be_started: 0,
        waiting: 1,
        making: 2,
        conpleted: 3
    }
end
