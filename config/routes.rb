Rails.application.routes.draw do
  resources :products, only: [:new, :create, :destroy]
  root "products#index"
end
