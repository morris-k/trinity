class EventController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    Event.create(params[:event])
  end

  def update
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def delete
    @event = Event.find(params[:id])
    if (@event.destroy)
      flash[:success] = "Event deleted."
      redirect_to index
    else 
      render @event 
    end
  end
end


private

  def event_params
    params.require(:event).allow(:title, :date, :start_time, :end_time, :location, :description)
  end
end
