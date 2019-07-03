class ChangeCampsitesTable < ActiveRecord::Migration[5.2]
  def change
    change_table :campsites do |t|
      t.string :regulationsurl
      t.string :weatheroverview
      t.string :campsites
      t.string :accessibility
      t.string :wheelchairaccess
      t.string :internetinfo
      t.string :rvallowed
      t.string :cellphoneinfo
      t.string :firestovepolicy
      t.string :rvmaxlength
      t.string :additionalinfo
      t.string :trailermaxlength
      t.string :adainfo
      t.string :rvinfo
      t.string :accessroads
      t.string :trailerallowed
      t.string :classifications
      t.string :directionsoverview
      t.string :reservationsurl
      t.string :directionsUrl
      t.string :reservationssitesfirstcome
      t.string :regulationsoverview
      t.string :latLong
      t.string :description
      t.string :reservationssitesreservable
      t.string :parkCode
      t.string :amenities
      t.string :reservationsdescription
    end
  end
end
