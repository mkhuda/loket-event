class UserController < ApplicationController
  def twitter_auth
    @omnidata = request.env['omniauth.auth']
    user = User.find_by(twitter_auth_id: @omnidata['uid'])
    if user.present?
      user.update_attribute(:twitter_token, @omnidata['credentials']['token'])
      user.update_attribute(:twitter_secret, @omnidata['credentials']['secret'])
      log_in user
      redirect_to dashboard_path
    else
      create_user = User.create(
        name: @omnidata['info']['name'],
        email: 'random@email.com',
        twitter_auth_id: @omnidata['uid'],
        twitter_username: @omnidata['info']['nickname'],
        twitter_token: @omnidata['credentials']['token'],
        twitter_secret: @omnidata['credentials']['secret']
      )
      if create_user
        log_in create_user
        redirect_to dashboard_path
      end
    end
  end
  
  def logout
		log_out if logged_in?
		redirect_to root_path
  end

	def failure
		redirect_to request.referer
	end
end
