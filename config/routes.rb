Rails.application.routes.draw do
  devise_for :users
  root to: "offers#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :offers do
    resources :bookings, only: [:create, :update, :edit, :show]
  end
  resources :bookings, only: [:destroy]
  get "/dashboard", to: "pages#home"
end
