class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to @event
    else
      flash[:error] = "#{@event.errors.full_messages}"
      render 'new'
    end
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

  def destroy
    dest = Event.find(params[:id]).destroy;
    puts "#{dest}"
    respond_to do |format|
      if dest
        format.html { redirect_to events_path, :notice => 'deleted' }
        format.json { head :no_content }
      else
        format.html { redirect_to events_path, :notice => "not deleted"}
        format.json { head :no_content }
      end
    end
  end


	private

	  def event_params
	    params.require(:event).permit(:title, :date, :start_time, :end_time, :location, :description)
	  end
end
