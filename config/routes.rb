TaggdIt::Application.routes.draw do
  devise_for :users, path_names: { sign_in: "login", sign_out: "logout" },
              controllers: { omniauth_callbacks: "omniauth_callbacks"}

  scope "(:locale)", locale: /en/ do
    resources :profile
    resources :comments
    resources :images do
      member { post :vote }
    end

    match '/about',       to: 'static_pages#about',     via: :get
    match '/policy',      to: 'static_pages#policy',    via: :get
  end
  root 'images#index'
end
