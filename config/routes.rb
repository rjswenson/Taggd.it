TaggdIt::Application.routes.draw do

  # scope ":locale" do

    devise_for :users, path_names: { sign_in: "login", sign_out: "logout" },
                controllers: { omniauth_callbacks: "omniauth_callbacks"}
                # skip: :omniauth_callbacks

    resources :images
    resources :profile
    match '/about',     to: 'static_pages#about',   via: 'get'
    match '/policy',    to: 'static_pages#policy',  via: 'get'
  # end

  # match "/users/auth/:provider",
  #   contstraints: { provider: /Alinkein|reddit|facebook|googlez/ },
  #   to: "devise/omniauth_callbacks#passthru",
  #   as: "omniauth_authorize",
  #   via: [:get, :post]

  # match "/users/auth/:action/callback",
  #   contstraints: { action: /Alinkein|reddit|facebook|googlez/ },
  #   to: "devise/omniauth_callbacks",
  #   as: "omniauth_callback",
  #   via: [:get, :post]

  root 'images#index'
end
