Rails.application.routes.draw do
  root 'home#index'
  # twitter auth
  get 'twitter_auth', to: redirect('/auth/twitter'), as: 'twitter_auth'
  get '/auth/twitter/callback', to: 'user#twitter_auth'
  match "/auth/failure", to: 'user#failure',  via: [:get, :post]
end
