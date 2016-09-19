class CreateAppyIbeaconTrackings < ActiveRecord::Migration
  def change
    create_table :appy_ibeacon_trackings do |t|
      t.text :message
      t.string :name

      t.timestamps
    end
  end
end
