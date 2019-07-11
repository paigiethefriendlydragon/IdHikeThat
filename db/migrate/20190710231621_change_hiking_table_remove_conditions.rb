class ChangeHikingTableRemoveConditions < ActiveRecord::Migration[5.2]
  def change
    change_table :hikes do |t|
      t.remove :conditions
    end
  end
end
