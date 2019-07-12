class ChangeHikesTable < ActiveRecord::Migration[5.2]
  def change
    change_table :hikes do |t|
    t.string :summary
    t.string :location
    t.string :imgSqSmall
    t.string :imgSmallMed
    t.string :imgMedium
    t.string :length
    t.string :ascent
    t.string :descent
    t.string :low
    t.string :latLong
    t.string :conditionStatus
    t.string :conditionDetails
    t.timestamp :conditionDate
    end
  end
end
