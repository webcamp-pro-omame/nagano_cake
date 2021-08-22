class Admins::HomesController < ApplicationController
  def top
    @orders = Order.all.page(params[:page]).per(10).order(created_at: :desc)
  end
end