class ChangeIdToInteger < ActiveRecord::Migration
  def change
    change_column :appy_ibeacon_trackings, :id, 'integer USING CAST(id AS integer)', auto_increment: true
  end
end
