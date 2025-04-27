class CreateAttendances < ActiveRecord::Migration[8.0]
  def change
    create_table :attendances do |t|
      t.string :attendee
      t.string :attended_event

      t.timestamps
    end
  end
end
