class ChangeParkColumnState < ActiveRecord::Migration[5.2]
  def change
    change_column_null :parks, :state, true
  end
end
