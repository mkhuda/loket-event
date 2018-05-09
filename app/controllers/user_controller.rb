class UserController < ApplicationController
  def twitter_auth
    @omniauth = request.env['omniauth.auth']
  end
  
  def logout
  end

	def failure
		redirect_to request.referer
	end
end
