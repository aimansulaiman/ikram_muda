Rails.application.routes.draw do
  resources :images
  resources :umrah_customers

  devise_for :users
  root to: "welcome#index"
  resources :umrah_packages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
