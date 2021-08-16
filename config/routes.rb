Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "customer/homes#top"
  get "about" => "customer/homes#about"
  resources :products, only: [:show, :index]
  resources :cart_products, only: [:index, :update, :destroy, :create]
  delete "cart_products/destroy_all" => "customer/cart_products#destroy_all"
  resources :orders, only: [:new, :index, :show, :create]
  post "orders/confirm" => "customer/orders#confirm"
  get "orders/thanks" => "customer/orders#thanks"
  resources "customers", only: [:show, :edit, :update]
  get "customers/unsubscribe" => "customer/customers#unsubscribe"
  patch "customers/withdraw" => "customer/customers#withdraw"
  resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]

  namespace :admin do
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :new, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update] do
      patch "order_products/:id" => "order_products#update"
    end
  end
end
