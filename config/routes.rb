TaggdIt::Application.routes.draw do

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout" },
              controllers: { omniauth_callbacks: "omniauth_callbacks"}

  resources :images
  resources :profile
  match '/about',     to: 'static_pages#about',   via: 'get'
  match '/policy',    to: 'static_pages#policy',  via: 'get'

  root 'images#index'
end
