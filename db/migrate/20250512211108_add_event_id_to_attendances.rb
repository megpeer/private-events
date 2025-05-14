class AddEventIdToAttendances < ActiveRecord::Migration[8.0]
  def change
    add_reference :attendances, :attended_event, null: false, foreign_key: { to_table: :events }
  end
end
