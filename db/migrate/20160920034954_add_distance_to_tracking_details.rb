class AddDistanceToTrackingDetails < ActiveRecord::Migration
  def change
    add_column :appy_ibeacon_tracking_details, :distance, :integer
  end
end
