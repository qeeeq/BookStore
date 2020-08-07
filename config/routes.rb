Rails.application.routes.draw do
  devise_for :customers
  root "books#index"
  resources :books
  ActiveAdmin.routes(self)
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end





