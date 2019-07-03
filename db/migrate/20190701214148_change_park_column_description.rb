class ChangeParkColumnDescription < ActiveRecord::Migration[5.2]
  def change
    change_column_null :parks, :description, true
  end
end
