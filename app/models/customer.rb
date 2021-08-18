class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #ログインする時に退会済み(is_deleted==true)のユーザーを弾くためのメソッド
  #def active_for_authentication?
    #super && (self.is_delete == false)
  #end
  
  has_many :cart_products, dependent: :destroy
  
  has_many :orders, dependent: :destroy
end
