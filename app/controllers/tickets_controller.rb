class TicketsController < ApplicationController
  before_action :require_authorization
  layout "dashboard"
  

  def new
    @ticket = current_user.events.find(params[:event_id]).tickets.new
  end

  def create
    @create_ticket = current_user.events.find(params[:event_id]).tickets.create(
      ticket_name: ticket_params[:ticket_name],
      ticket_detail: ticket_params[:ticket_detail],
      ticket_price: ticket_params[:ticket_price]
    )
    if @create_ticket.save
      redirect_to event_path(params[:event_id]), :flash => { :success => "Your ticket has been succesfully created" }
    else
      render 'new'
    end
  end

  private

    def ticket_params
      params.require(:ticket).permit(:ticket_name, :ticket_detail, :ticket_price)
    end

	def require_authorization
		redirect_to root_path unless logged_in?
	end
end
