class Customers::SearchesController < ApplicationController
  def search
    @product = Product.search(params[:keyword])
    @keyword = params[:keyword]
  end
end
