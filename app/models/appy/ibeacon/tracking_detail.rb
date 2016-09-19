module Appy::Ibeacon
  class TrackingDetail < ActiveRecord::Base
    include Appy::Concerns::Sortable

    belongs_to :appy_users
    belongs_to :appy_ibeacon_trackings

    attr_accessible :tracking_id, :active_time, :user_id

    sortable_by_fields :id, :active_time, :user_id

    SEARCH_FIELDS = %w(id tracking_id active_time)

    def insert_tracking_details(tracking_id, active_time, user)
      self.tracking_id = tracking_id
      self.user_id = user
      self.active_time = active_time
      self.save
    end
  end
end
