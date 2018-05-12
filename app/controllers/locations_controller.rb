class LocationsController < ApplicationController
  before_action :require_authorization
  layout "dashboard"

  def new
    @location = Location.new
  end

  def create
    @lp = location_params
    @create_master_location = Location.create(name: @lp[:name])
    if @create_master_location
      @create_event_location = current_user.events.find(params[:event_id]).create_event_location(
        location_id: @create_master_location.id,
        description: @lp[:description]
      ).save
      redirect_to event_path(params[:event_id]),
        :flash => { :success => "Your Location Has Been Set" }
    else
      render 'new'
    end
  end

  private
    def location_params
      params.require(:location).permit(:name, :description)
    end

	def require_authorization
		redirect_to root_path unless logged_in?
	end
end
