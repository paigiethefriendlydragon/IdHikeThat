class ChangeParkColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_null :parks, :latLong, true
  end
end
