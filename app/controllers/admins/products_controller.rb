class Admins::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to admin_product_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to admin_product_path
  end

  private
  def product_params
    params.require(:product).permit(:image_id, :name, :detail, :genre_id, :price, :status)
  end
end
