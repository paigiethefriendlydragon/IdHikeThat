class CreateHikingJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :hiking_join do |t|
      t.belongs_to :hikes, null: false
      t.belongs_to :parks, null: false

      t.timestamps
    end
  end
end
