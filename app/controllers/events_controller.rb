class EventsController < ApplicationController
  def index
    @event = Event.new
    @events = Event.all.order(created_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      redirect_to profile_path(current_user), notice: 'event has not been edited'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    flash.alert = if @event.destroy
                    'event deleted'
                  else
                    'event not deleted'
                  end
    redirect_to profile_path(current_user)
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    respond_to do |format|
      if @event.save
        format.turbo_stream
        redirect_to root_path
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
