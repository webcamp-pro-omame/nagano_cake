class Admins::OrderProductsController < ApplicationController
  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    redirect_to admins_order_path(params[:order_id])
  end

  private

  def order_product_params
    params.require(:order_product).permit(:status)
  end
end
