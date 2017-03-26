class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.start_time = parse_datetime_params(params[:event], :start_time)
    @event.end_time = parse_datetime_params(params[:event], :end_time)
    # puts "start #{@event.start_time}"
    if @event.save
      flash[:success] = "Event created!"
      redirect_to calendar_path
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
	    params.require(:event).permit(:title, :start_time, :end_time, :location, :description, {:recurring_rules => []})
	  end

    def parse_datetime_params params, label
      begin
          # m = "#{label.to_s}(1i)"
          ampm = (params[(label.to_s + '(6i)').to_sym] || 0).to_i
          month   = params[(label.to_s + '(2i)').to_sym].to_i
          day  = params[(label.to_s + '(3i)').to_sym].to_i
          year   = params[(label.to_s + '(1i)').to_sym].to_i
          hour   = (params[(label.to_s + '(4i)').to_sym] || 0).to_i + ampm
          minute = (params[(label.to_s + '(5i)').to_sym] || 0).to_i
          # puts "#{label.to_s} #{month} #{day} #{year} #{hour} #{minute}"


          return DateTime.new(year,month,day,hour,minute)
        rescue => e
          puts "ERROR #{e}"
          return nil
        end
    end
end
