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
    product.genre_id = params[:product][:genre].to_i
    product.save!
    redirect_to admins_product_path(product)
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
    redirect_to admins_product_path
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :detail, :price, :status)
  end
end
