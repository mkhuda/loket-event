class LocationsController < ApplicationController
  before_action :require_authorization
  layout "dashboard"

  def new
    @location = Location.new
  end

  def create
    @lp = location_params
    @search_location = Location.search_location(@lp[:name])
    if @search_location
      @create_event_location = current_user.events.find(params[:event_id]).create_event_location(
        location_id: @search_location.id,
        description: @lp[:description]
      ).save
      redirect_to event_path(params[:event_id]),
        :flash => { :success => "Your Location Has Been Set" }
    else
      render 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
    @default_location = current_user.events.find(params[:event_id]).event_location
  end

  def update
    @default_location = current_user.events.find(params[:event_id])
    @lp = update_location_params
    @search_location = Location.search_location(@lp[:name])
    if @search_location
      @create_event_location = current_user.events.find(params[:event_id])
        .event_location.update_attributes(
        location_id: @search_location.id,
        description: @lp[:description]
      )
      redirect_to event_path(params[:event_id]),
        :flash => { :success => "Your Location Has Been Set" }
    else
      render 'edit'
    end
  end

  def destroy
    @event_location = current_user.events.find(params[:event_id]).event_location
    if @event_location.destroy
      redirect_to event_path(params[:event_id]),
        :flash => { :success => "Location has been deleted" }
    else
      redirect_to event_path(params[:event_id]),
        :flash => { :error => "Ooops. Something wrong when deleting location!" }
    end
  end

  private
    def location_params
      params.require(:location).permit(:name, :description)
    end

    def update_location_params
      params.require(:event_location).permit(:name, :description)
    end

	def require_authorization
		redirect_to root_path unless logged_in?
	end
end
