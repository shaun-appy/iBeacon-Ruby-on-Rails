module Appy::Ibeacon
  class Tracking < ActiveRecord::Base

    include Appy::Concerns::Sortable

    has_many :person
    has_many :tracking_details

    attr_accessible :last_active, :name, :message, :tracking_id

    validates :tracking_id, :name, :message, presence: true

    sortable_by_fields :tracking_id, :name, :message, :last_active

    SEARCH_FIELDS = %w(id name message distance)

  end
end
