Rails.application.routes.draw do

  root to: "products#index"

  get 'products/index'
  get 'products/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "products#index"
end
