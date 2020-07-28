Rails.application.routes.draw do
	root "books#index"
	get 'index', to: 'books#index'
  devise_for :customers
  ActiveAdmin.routes(self)
  resources :books
  resources :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end





