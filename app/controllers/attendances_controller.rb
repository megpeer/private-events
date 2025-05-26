class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    if Attendance.find_by(attendance_params).nil?
      @attendance = Attendance.new(attendance_params)

      respond_to do |format|
        if @attendance.save
          format.html { redirect_to root_path, notice: 'you are attending the event!' }
        else
          format.html { redirect_to root_path 'index', notice: 'an error occured' }
        end
      end
    else
      flash.alert = 'you are already attending this event'
      redirect_to root_path
    end
  end

  def destroy
    @attendance = Attendance.find(attendance_params)
    flash.notice = 'you are no longer attending this event'
    redirect_to profile_path
  end

  private

  def attendance_params
    params.permit(:attendee_id, :attended_event_id)
  end
end
