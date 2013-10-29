TaggdIt::Application.routes.draw do

  devise_for :users

  resources :images

  root 'static_pages#index'
  resources :static_pages

  resources :profile

end
