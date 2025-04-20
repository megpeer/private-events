class EventsController < ApplicationController
  def index
    @event = Event.new
    @events = Event.all.order(created_at: :desc)
  end

  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.turbo_stream
      else
        format.html do
          flash[:event_errors] = @event.errors.full_messages
          redirect_to root_path
        end
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :body)
  end
end
