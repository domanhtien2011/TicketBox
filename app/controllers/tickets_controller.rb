class TicketsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new
  end

  def purchase
    params[:quantity]
    redirect_to ticket_finish_path
  end

  def finish
    @event = Event.find(params[:event_id])
  end
end
