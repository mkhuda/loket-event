Rails.application.routes.draw do
  
  root 'home#index'

  # twitter auth
  get 'twitter_auth', to: redirect('/auth/twitter'), as: 'twitter_auth'
  get '/auth/twitter/callback', to: 'user#twitter_auth'
  match "/auth/failure", to: 'user#failure',  via: [:get, :post]

  # logout
  delete 'logout', to: 'user#logout'

  # public event
  get 'events', to: 'public_event#index', as: 'public_event'
  get 'events/:id', to: 'public_event#show'

  # dashboard
  get 'dashboard', to: 'events#index'

  # resources
  scope '/dashboard' do
    resources :events do
      resources :tickets
      resources :locations
    end
  end

  # post to twitter
  post 'post_to_twitter/:id', to: 'events#post_to_twitter', as: 'post_to_twitter'

end
