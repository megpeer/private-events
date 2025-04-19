class EventsController < ApplicationController
  def index
    @event = event.new
    @events = event.all.order(created_at: :asc)
  end
end
