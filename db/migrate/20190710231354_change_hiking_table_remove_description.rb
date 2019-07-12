class ChangeHikingTableRemoveDescription < ActiveRecord::Migration[5.2]
    def change
      change_table :hikes do |t|
        t.remove :description
      end
  end
end
