class RemoveAttendedEventFromAttendances < ActiveRecord::Migration[8.0]
  def change
    remove_column :attendances, :attended_event
  end
end
