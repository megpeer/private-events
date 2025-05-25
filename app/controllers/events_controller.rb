class EventsController < ApplicationController
  def index
    @event = Event.new
    @events = Event.all.order(created_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
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
    params.require(:event).permit(:title, :date, :location, :body)
  end
end
