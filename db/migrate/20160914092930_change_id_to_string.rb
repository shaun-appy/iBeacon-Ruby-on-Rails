class ChangeIdToString < ActiveRecord::Migration
  def change
    change_column :appy_ibeacon_trackings, :id, :string
  end
end
