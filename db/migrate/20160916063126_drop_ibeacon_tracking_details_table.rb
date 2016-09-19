class DropIbeaconTrackingDetailsTable < ActiveRecord::Migration
  def change
    drop_table :appy_ibeacon_tracking_details
  end
end
