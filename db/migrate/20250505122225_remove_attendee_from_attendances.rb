class RemoveAttendeeFromAttendances < ActiveRecord::Migration[8.0]
  def change
    remove_column :attendances, :attendee
  end
end
