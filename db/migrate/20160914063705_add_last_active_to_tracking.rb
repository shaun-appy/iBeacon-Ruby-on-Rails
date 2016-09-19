class AddLastActiveToTracking < ActiveRecord::Migration
  def change
    add_column :appy_ibeacon_trackings, :last_active, :datetime
  end
end
