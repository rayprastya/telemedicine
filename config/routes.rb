Rails.application.routes.draw do
  resources :meetings
  resources :users

  resources :doctors
  resources :accounts
  resources :articles

  get 'admin_page/index'
  resources :medicines
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'


  get 'diagnoses/index'
  get 'homepage/index'
  
  root "homepage#index"

  get "/login",
    to: "home#index",
    as: "Home_index"

  get "/diagnoses",
    to: "diagnoses#index",
    as: "Diagnoses_index"

  post "/diagnoses/index",
    to: "diagnoses#result",
    as: "diagnoses_result"

  get "/article",
    to: "articles#user_index",
    as: "user_index_article"

  get "/medicine",
    to: "medicines#user_index",
    as: "user_index_medicine"

  get "/doctor",
    to: "doctors#user_index",
    as: "user_index_doctor"

end
