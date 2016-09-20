class AddDistanceToTracking < ActiveRecord::Migration
  def change
    add_column :appy_ibeacon_trackings, :distance, :integer
  end
end
