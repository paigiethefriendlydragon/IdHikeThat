class ChangeCampsiteTableRemoveWrongOnes < ActiveRecord::Migration[5.2]
  def change
    change_table :campsites do |t|
      t.remove :wheelchairaccess
      t.remove :internetinfo
      t.remove :rvallowed
      t.remove :cellphoneinfo
      t.remove :firestovepolicy
      t.remove :rvmaxlength
      t.remove :additionalinfo
      t.remove :trailermaxlength
      t.remove :adainfo
      t.remove :rvinfo
      t.remove :accessroads
      t.remove :trailerallowed
      t.remove :classifications
    end
  end
end
