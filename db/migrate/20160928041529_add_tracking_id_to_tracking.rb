class AddTrackingIdToTracking < ActiveRecord::Migration
  def change
    add_column :appy_ibeacon_trackings, :tracking_id, :string
  end
end
