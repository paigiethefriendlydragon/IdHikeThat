class ChangeParkColumnDirections < ActiveRecord::Migration[5.2]
  def change
    change_column_null :parks, :directionsInfo, true
  end
end
