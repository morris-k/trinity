class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    Event.create(params[:event])
  end

  def edit
  	@event = Event.find(params[:id]);
  end

  def update
    @event = Event.find(params[:id]);
    if @event.update_attributes(event_params)
      @event.save
      render 'show'
    else
      render 'edit'
    end
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
      flash[:error] = "Unable to delete event."
      redirect_to 'index'
    end
  end


	private

	  def event_params
	    params.require(:event).permit(:title, :date, :start_time, :end_time, :location, :description)
	  end
end
