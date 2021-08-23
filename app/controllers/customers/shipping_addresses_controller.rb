class Customers::ShippingAddressesController < ApplicationController
    
def index
    @shipping_address_new = ShippingAddress.new
    @shipping_addresses = current_customer.shipping_addresses
end

def create
    @shipping_address_new = ShippingAddress.new(shipping_params)
    @shipping_address_new.customer_id = current_customer.id
    if @shipping_address_new.save
       redirect_to shipping_addresses_path
    else
       @shipping_addresses = current_customer.shipping_addresses
       render :index
    end
end

def edit
    @shipping_address = ShippingAddress.find(params[:id])
end

def update
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.update(shipping_params)
    redirect_to shipping_addresses_path
end


def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to shipping_addresses_path
end

private

def shipping_params
    params.require(:shipping_address).permit(:name, :postcode, :address)
end

end
