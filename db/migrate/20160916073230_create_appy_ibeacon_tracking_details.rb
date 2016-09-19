class CreateAppyIbeaconTrackingDetails < ActiveRecord::Migration
  def change
    create_table :appy_ibeacon_tracking_details do |t|
      t.datetime :active_time
      t.references :tracking, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
