class Admins::OrderProductsController < ApplicationController
  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    order = @order_product.order
    @order_products = order.order_products
    order_products_completed = @order_products.where(status: "製作完了")
    if @order_product.status == "製作中"
      @order_product.order.status = "製作中"
      @order_product.order.save
    elsif @order_products.count == order_products_completed.count
      @order_product.order.status = "発送準備中"
      @order_product.order.save
    end
    redirect_to admins_order_path(params[:order_id])
  end

  private

  def order_product_params
    params.require(:order_product).permit(:status)
  end
end
