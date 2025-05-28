class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    return unless Attendance.find_by(attendance_params).nil?

    @attendance = Attendance.new(attendance_params)
    @attendance.save
    redirect_to profile_path(current_user)
    flash.alert = 'you are now attending this event'
  end

  def destroy
    @attendance = Attendance.find_by(attendance_params)
    @attendance.destroy
    redirect_to profile_path(current_user)
    flash.notice = 'you are no longer attending this event'
  end

  private

  def attendance_params
    params.permit(:attendee_id, :attended_event_id)
  end
end
