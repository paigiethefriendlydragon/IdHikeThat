class ChangeCampsiteTableNewSeedsJul18 < ActiveRecord::Migration[5.2]
  def change
    add_column :campsites, :contacts, :string
    add_column :campsites, :fees, :string
    add_column :campsites, :images, :string
    add_column :campsites, :addresses, :string
  end
end
