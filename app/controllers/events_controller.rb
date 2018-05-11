class EventsController < ApplicationController
  before_action :require_authorization
  layout "dashboard"

  def index
    @event = Event.where("user_id = ?", current_user.id)
  end

  def new
    @event = Event.new
  end

  def create
    @event_params = event_params
    @start_date = @event_params.select {|k, _| k.include? "event_start_date"}.values.join('-').to_date
		@event = current_user.events.create(
      name: @event_params[:name],
      event_detail: @event_params[:event_detail],
      event_start_date: @start_date,
    )
		if @event.save
      redirect_to event_path(@event.id), :flash => { :success => "Your event has been succesfully created" }
		else
			render 'new'
		end
  end
  
  def show
    @event = current_user.events.find(params[:id])
    @event_location = @event.event_location
    @event_tickets = @event.tickets
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event_params = event_params
    @start_date = @event_params.select {|k, _| k.include? "event_start_date"}.values.join('-').to_date
    @event = current_user.events.find(params[:id]).update_attributes(
      name: @event_params[:name],
      event_detail: @event_params[:event_detail],
      event_start_date: @start_date,
    )
		if @event
      redirect_to event_path(params[:id]), :flash => { :success => "Your event has been edited" }
		else
			render 'new'
		end
  end

	private
		def event_params
			params.require(:event).permit(:name, :event_detail, :event_start_date, :event_end_date)
		end

	def require_authorization
		redirect_to root_path unless logged_in?
	end
end
