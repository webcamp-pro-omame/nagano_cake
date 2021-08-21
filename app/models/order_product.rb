class OrderProduct < ApplicationRecord
    belongs_to :order
    belongs_to :product

    enum status: {
        cannot_be_started: 0,
        waiting: 1,
        making: 2,
        conpleted: 3
    }
    enum status: { 着手不可: 0, 制作待ち: 1, 制作中: 2, 制作完了: 3 }

end
