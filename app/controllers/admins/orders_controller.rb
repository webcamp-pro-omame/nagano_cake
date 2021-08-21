class Admins::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admins_order_path(@order.id)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)  
  end
end
