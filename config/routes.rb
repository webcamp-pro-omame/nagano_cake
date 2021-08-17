Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :customers do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :products, only: [:show, :index]
    resources :cart_products, only: [:index, :update, :destroy, :create]
    delete "cart_products/destroy_all" => "cart_products#destroy_all"
    resources :orders, only: [:new, :index, :show, :create]
    post "orders/confirm" => "orders#confirm"
    get "orders/thanks" => "orders#thanks"
    resources "customers", only: [:show, :edit, :update]
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
    resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
  end

  namespace :admins do
    root to: "homes#top"
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [ :show, :update] do
      patch "order_products/:id" => "order_products#update"
    end
  end
end
