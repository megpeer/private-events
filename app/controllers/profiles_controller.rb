class ProfilesController < ApplicationController
  before_action :authenticate_user!
  # def show
  #   @profile = User.find(current_user.id)
  #   @attendee = User.find(current_user.attendances.attendee_id)
  # end
  def show
    @hosted_events = current_user.events.all
    @attending_events = current_user.attended_events.future_events
    @attended_events = current_user.attended_events.past_events
  end
end
