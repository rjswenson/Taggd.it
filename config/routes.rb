TaggdIt::Application.routes.draw do

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout" },
              controllers: { omniauth_callbacks: "omniauth_callbacks"}

  resources :images
  resources :static_pages
  resources :profile

  root 'static_pages#index'
end
