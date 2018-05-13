class EventsController < ApplicationController
  before_action :require_authorization
  layout "dashboard"

  # Return all events where user_id is current user id
  # Used in views/events/index.html.erb
  def index
    @event = Event.where("user_id = ?", current_user.id)
  end

  # Return Event class to build a form_for
  # Used in views/events/new.html.erb
  def new
    @event = Event.new
  end

  # Create event action to save event parameters
  # It will redirect to event_path(event_id) when successfull
  # and fallback render form if failed
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
  
  # Show detail on event detail
  # Three different variable to specify location, tickets, and event itself
  def show
    @event = current_user.events.find(params[:id])
    @event_location = @event.event_location
    @event_tickets = @event.tickets
  end

  # Edit event
  # Used in views/events/edit.html.erb
  def edit
    @event = current_user.events.find(params[:id])
  end

  # Update action for edit event form
  # Redirect to event page itself when successfully edit
  # and fallback render edit form when failed
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
      render 'edit'
    end
  end

  # Destroy event action
  # Used on events dashboard and show event dashboard (detail event in dashboard)
  def destroy
    @delete = current_user.events.find(params[:id]).destroy
    if @delete
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
  end

  # Post to twitter
  # Uses a method helper in helpers/twitter_helper.rb called event_post_to_twitter
  def post_to_twitter
    tweet = event_post_to_twitter(current_user.events.find(params[:id]))
    if tweet
      tweet_url = "https://twitter.com/#{current_user.twitter_username}/status/#{tweet.id}"
      redirect_to request.referer, :flash => { :success => "Your event has been twitted, see: #{tweet_url}" }
    else
      redirect_to request.referer, :flash => { :error => "Ooops. something wrong" }
    end
  end

  # Private method include event_params
  # Used by create action and edit action
	private
		def event_params
			params.require(:event).permit(:name, :event_detail, :event_start_date, :event_end_date)
		end

	def require_authorization
		redirect_to root_path unless logged_in?
	end
end
