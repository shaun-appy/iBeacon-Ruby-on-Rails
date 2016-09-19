class ChangeTrackingidToString < ActiveRecord::Migration
  def change
    change_column :appy_ibeacon_tracking_details, :tracking_id, :string
  end
end
