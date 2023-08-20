Rails.application.routes.draw do
  resources :products, only: [:new, :create, :destroy]
  get "/products/search" => "products#search", as: :search_product
  root "products#index"
end
