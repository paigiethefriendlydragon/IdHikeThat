class RemoveUrl < ActiveRecord::Migration[5.2]
  def change
    change_table :parks do |t|
      t.remove :url
    end
  end
end
