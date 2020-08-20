Rails.application.routes.draw do
  devise_for :customers
  root "books#index"
  resources :books

  resources :orders
  resources :credit_cards
  # post '/add_to_order/:order_item_id', to: 'orders#add_to_order', as: 'add_to_order'
  resources :order_items, only: %i[create]

  ActiveAdmin.routes(self)
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end





