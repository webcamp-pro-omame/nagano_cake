class Customers::CartProductsController < ApplicationController
  
  def index
    @cart_products = current.customer.cart_products
  end
  
  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(amount: params[:amount].to_i)
    redirect_to cart_products_path
  end
  
  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end
  
  def destroy_all
    @cart_products = current.customer.cart_products
    @cart_products.destroy_all
    redirect_to cart_products_path
  end
  
  def create
    @cart_product = current_user.cart_items.new(cart_product_params)
    @cart_product.save
    redirect_to cart_products_path
  end
  
  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :customer_id, :amount)
  end
  
end
