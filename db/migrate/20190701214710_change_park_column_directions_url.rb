class ChangeParkColumnDirectionsUrl < ActiveRecord::Migration[5.2]
  def change
    change_column_null :parks, :directionsUrl, true
    change_column_null :parks, :fullName, true
    change_column_null :parks, :url, true
    change_column_null :parks, :weatherInfo, true
  end
end
