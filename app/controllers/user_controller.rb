class UserController < ApplicationController
  def twitter_auth
    @omniauth = request.env['omniauth.auth']
  end
end
