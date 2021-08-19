class Customers::OrdersController < ApplicationController
    def index
    end
    
    
    def thanks
    end
    
    def new
        @order = Order.new
        @address = current_customer.address
        @shipping_address_new = ShippingAddress.new
        @shipping_addresses = current_customer.shipping_addresses
    end
    
    def create
        #@order = Order.new(order_params)
        #@order.save
        #redirect_to
        
        
        
    end
    
    
    
    
    def confirm
        
        @order = Order.new(order_params)
        @order.payment_method = params[:order][:payment_method] 
        if params[:order][:address_num] == "0"
            @order.postcode = current_customer.postcode
            @order.address = current_customer.address
            @order.name = current_customer.last_name + current_customer.first_name
        elsif params[:order][:address_num] == "1"
            #@customer = current_customer
            @cart_products = current_customer.cart_products
            @shipping_address = ShippingAddress.find(params[:order][:address_box])
            
            @order.postcode = @shipping_address.postcode
            @order.address = @shipping_address.address
            @order.name = @shipping_address.name
            
        elsif params[:order][:address_num] == "2"
            @order.postcode = params[:order][:postcode]
            @order.address = params[:order][:address]
            @order.name = params[:order][:name]
        end
        
    end
    
    def show
    end
    
    
    private
    
    def order_params
        params.require(:order).permit(:payment_method, :postcode, :address, :name)
    end
    
end
