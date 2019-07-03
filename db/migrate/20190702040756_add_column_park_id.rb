class AddColumnParkId < ActiveRecord::Migration[5.2]
  def change
    add_column :parks, :parkCode, :string
  end
end
