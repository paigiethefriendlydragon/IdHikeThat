class ChangeCampsiteTable < ActiveRecord::Migration[5.2]
  def change
    change_column_null :campsites, :name, true
  end
end
