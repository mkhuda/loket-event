class TicketsController < ApplicationController
  before_action :require_authorization
  layout "dashboard"

	def require_authorization
		redirect_to root_path unless logged_in?
	end
end
