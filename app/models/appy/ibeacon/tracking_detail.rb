module Appy::Ibeacon
  class TrackingDetail < ActiveRecord::Base
    include Appy::Concerns::Sortable
    
    belongs_to :tracking

    attr_accessible :tracking_id, :active_time, :user_id

    sortable_by_fields :id, :active_time, :user_id, :distance

    SEARCH_FIELDS = %w(id tracking_id active_time distance)

    def insert_tracking_details(tracking_id, active_time, user, distance)
      self.tracking_id = tracking_id
      self.user_id = user
      self.active_time = active_time
      self.distance = distance
      self.save
    end

  end
end
