class RemoveUserIdAndEventIdFromAttendances < ActiveRecord::Migration[8.0]
  def change
    remove_column :attendances, :user_id
  end
end
