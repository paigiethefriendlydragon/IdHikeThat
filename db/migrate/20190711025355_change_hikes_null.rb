class ChangeHikesNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :hikes, :name, true
  end
end
