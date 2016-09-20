module Appy::Ibeacon
  class Tracking < ActiveRecord::Base

    include Appy::Concerns::Sortable

    has_many :appy_ibeacon_tracking_details
    has_many :appy_users

    attr_accessible :last_active, :id, :name, :message

    validates :id, :name, :message, presence: true

    sortable_by_fields :id, :name, :message, :last_active

    SEARCH_FIELDS = %w(id name message distance)

  end
end
