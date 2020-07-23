Rails.application.routes.draw do
  ActiveAdmin.routes(self)
	root "books#index"
  resources :books
  resources :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
