class ChangeParkColumnDesignation < ActiveRecord::Migration[5.2]
  def change
    change_column_null :parks, :designation, true
  end
end
