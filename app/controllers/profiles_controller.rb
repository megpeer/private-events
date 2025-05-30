class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @hosted_events = current_user.events.all
    @attending_events = current_user.attended_events.future_events
    @attended_events = current_user.attended_events.past_events
  end
end
