class EventDemandship < ApplicationRecord
	validates_uniqueness_of :demand_id, :scope => :event_id
	belongs_to :event
	belongs_to :demand
end
