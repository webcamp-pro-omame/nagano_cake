Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :customers do
    root to: "homes#top"
    get '/search' => 'searches#search'
    get "about" => "homes#about"
    get "orders/new" => "orders#new"
    post "orders/confirm" => "orders#confirm"
    get "orders/thanks" => "orders#thanks"
    resources :orders, only: [:index, :show, :create]
    resources :products, only: [:show, :index]
    delete "cart_products/destroy_all" => "cart_products#destroy_all"
    resources :cart_products, only: [:index, :update, :destroy, :create]

    resource "customers", only: [:show, :edit, :update]

    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
    resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
  end

 devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

  namespace :admins do
    root to: "homes#top"
    get "search" => 'searches#search'
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [ :show, :update] do
      patch "admins/order_products/:id" => "order_products#update", as: "order_product"
    end
  end
end