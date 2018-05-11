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
    @end_date = @event_params.select {|k, _| k.include? "event_end_date"}.values.join('-').to_date
		@event = current_user.events.create(
      name: @event_params[:name],
      event_detail: @event_params[:event_detail],
      event_start_date: @start_date,
      event_end_date: @end_date
    )
		if @event.save
			redirect_to events_path, :flash => { :success => "Your event has been succesfully created" }
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
