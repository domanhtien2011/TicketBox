class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def index
    @search = params[:search] ? params[:search].strip : ''
    if @search.empty?
      @events = Event.check_event_validation
    else
       @events = Event.check_event_validation.search(@search)
     end
  end

  def user_events
    @events = Event.where(user_id: current_user.id)
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    if !(user_signed_in? && current_user.id == @event.user_id)
      if !@event.has_ticket_types?
        flash[:danger] = 'We are sorry, this event is not ready yet!'
        redirect_to(root_path)
      end
    end
  end

  def create
    @event = current_user.events.build(event_params)
      if @event.save
        flash[:success] = 'Event has been created succesfully'
        redirect_to(new_event_ticket_type_path(@event))
      else
        render 'new'
      end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:success] = 'Event has been updated successfully'
      redirect_to(@event)
    else
      render 'edit'
    end
  end

  private

    def event_params
      params.require(:event).permit(:starts_at, :ends_at, :hero_image_url, :extended_html_description, :name, :venue_id, :category_id, :user_id)
    end
end
