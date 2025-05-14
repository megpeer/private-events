class RemoveEventIdFromAttendances < ActiveRecord::Migration[8.0]
  def change
    remove_column :attendances, :event_id
  end
end
