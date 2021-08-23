class Admins::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_products = @order.order_products
    if @order.status == "入金確認"
      @order_products.each do |order_product|
        order_product.status = "製作待ち"
        order_product.save
      end
    end
    redirect_to admins_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
