  Rails.application.routes.draw do
  resources :images do
    # get "update_package", to: "images#new_wp", on: :new
  end


  # resources :images, path_names: { new: 'new/:is_update_package' }
  # resources :umrah_customers

  devise_for :users
  resources "home"
  # root to: "welcome#index"

  # namespace :admin do
  #   resources :umrah_customers
  #   resources :umrah_packages
  # end

  root to: "home#index"

  get 'uploads/admin/umrah_customer/:form/:id/:filename', to: 'umrah_customers#show', as: :view_pdf_file
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
