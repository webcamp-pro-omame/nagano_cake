class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      
      t.integer :order_id , null: false
      t.integer :product_id , null: false
      t.integer :amount , null: false
      t.integer :price , null: false
      t.integer :status , null: false

      t.timestamps
    end
  end
end
