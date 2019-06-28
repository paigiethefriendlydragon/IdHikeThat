class CreateHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
      t.string :name, null: false
      t.string :difficulty
      t.string :description, null: false
      t.string :conditions, null: false
    end
  end
end
