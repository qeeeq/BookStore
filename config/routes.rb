Rails.application.routes.draw do
  devise_for :customers
  root "books#index"
  ActiveAdmin.routes(self)
  resources :books
  resources :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end





