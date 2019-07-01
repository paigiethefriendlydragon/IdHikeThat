class AddColumnsToParks < ActiveRecord::Migration[5.2]
  def change
    add_column :parks, :state, :string, null: false
    add_column :parks, :latLong, :string, null: false
    add_column :parks, :description, :string, null: false
    add_column :parks, :designation, :string, null: false
    add_column :parks, :directionsInfo, :string, null: false
    add_column :parks, :directionsUrl, :string, null: false
    add_column :parks, :fullName, :string, null: false
    add_column :parks, :url, :string, null: false
    add_column :parks, :weatherInfo, :string, null: false
  end
end
