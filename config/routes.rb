Rails.application.routes.draw do
  devise_for :customers
  root "books#index"
  get '/customers/:id', to: 'customers#show', as: 'customer'
  put '/customers/:id', to: 'customers#update', as: 'customer_update'

  resources :books
  resources :orders
  # get orders/:status, to "orders#show", as: orders 
  # post '/add_to_order/:order_item_id', to: 'orders#add_to_order', as: 'add_to_order'
  
  resources :credit_cards do
    collection do
      delete :destroy_all
    end
  end

  resources :order_items #only: %i[create destroy]
  resources :billing_addresses
  resources :shipping_addresses
  resources :ratings
  # put '/ratings/:id', to: 'ratings#update', as: 'ratings_update'
  

  ActiveAdmin.routes(self)
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

